<?php
/**
 * IO Group - Distribuidor de Mensajes Round-Robin
 * Asigna conversaciones de WhatsApp entre agentes disponibles
 */

require_once __DIR__ . '/../config/database.php';

class MessageDistributor
{
    /**
     * Asignar conversación al siguiente agente disponible (Round-Robin)
     * @return array|false Datos del agente asignado o false si no hay disponibles
     */
    public function assignConversation($conversationId)
    {
        try {
            db()->beginTransaction();

            // Buscar agente disponible con menor carga y más tiempo sin asignación
            $agent = db()->queryOne(
                "SELECT ad.*, u.nombre_completo, u.username, u.email
                 FROM AgentDistribution ad
                 JOIN Usuario u ON ad.id_usuario = u.id_usuario
                 WHERE ad.activo = 1 
                   AND u.activo = 1
                   AND ad.conversaciones_activas < ad.max_conversaciones
                 ORDER BY ad.ultimo_asignado IS NULL DESC, ad.ultimo_asignado ASC
                 LIMIT 1"
            );

            if (!$agent) {
                db()->rollBack();
                return false;
            }

            // Asignar conversación al agente
            db()->execute(
                "UPDATE WhatsAppConversation 
                 SET id_usuario_asignado = ?, estado = 'asignada' 
                 WHERE id_conversation = ?",
                [$agent['id_usuario'], $conversationId]
            );

            // Incrementar contador del agente
            db()->execute(
                "UPDATE AgentDistribution 
                 SET conversaciones_activas = conversaciones_activas + 1, 
                     ultimo_asignado = NOW() 
                 WHERE id_usuario = ?",
                [$agent['id_usuario']]
            );

            db()->commit();

            return [
                'id_usuario' => $agent['id_usuario'],
                'nombre' => $agent['nombre_completo'],
                'username' => $agent['username'],
                'email' => $agent['email'],
                'conversaciones_activas' => $agent['conversaciones_activas'] + 1,
                'max_conversaciones' => $agent['max_conversaciones']
            ];
        } catch (\Exception $e) {
            db()->rollBack();
            error_log("Error en distribución de mensajes: " . $e->getMessage());
            return false;
        }
    }

    /**
     * Liberar una conversación cuando se cierra
     */
    public function releaseConversation($conversationId)
    {
        // Obtener el agente asignado
        $conversation = db()->queryOne(
            "SELECT id_usuario_asignado FROM WhatsAppConversation WHERE id_conversation = ?",
            [$conversationId]
        );

        if ($conversation && $conversation['id_usuario_asignado']) {
            db()->execute(
                "UPDATE AgentDistribution 
                 SET conversaciones_activas = GREATEST(0, conversaciones_activas - 1) 
                 WHERE id_usuario = ?",
                [$conversation['id_usuario_asignado']]
            );
        }
    }

    /**
     * Obtener carga actual de todos los agentes
     */
    public function getAgentLoad()
    {
        return db()->query(
            "SELECT ad.*, u.nombre_completo, u.username, u.email
             FROM AgentDistribution ad
             JOIN Usuario u ON ad.id_usuario = u.id_usuario
             WHERE u.activo = 1
             ORDER BY ad.activo DESC, u.nombre_completo ASC"
        );
    }

    /**
     * Redistribuir conversaciones sin asignar
     */
    public function rebalance()
    {
        // Obtener conversaciones abiertas sin asignar
        $unassigned = db()->query(
            "SELECT id_conversation FROM WhatsAppConversation 
             WHERE estado = 'abierta' AND id_usuario_asignado IS NULL 
             ORDER BY fecha_creacion ASC"
        );

        $assigned = 0;
        foreach ($unassigned as $conv) {
            $result = $this->assignConversation($conv['id_conversation']);
            if ($result) {
                $assigned++;
            } else {
                break; // No hay más agentes disponibles
            }
        }

        return $assigned;
    }

    /**
     * Sincronizar contadores de conversaciones activas
     */
    public function syncCounters()
    {
        db()->execute(
            "UPDATE AgentDistribution ad 
             SET conversaciones_activas = (
                 SELECT COUNT(*) FROM WhatsAppConversation wc 
                 WHERE wc.id_usuario_asignado = ad.id_usuario 
                   AND wc.estado IN ('abierta', 'asignada')
             )"
        );
    }

    /**
     * Agregar agente al pool de distribución
     */
    public function addAgent($userId, $maxConversaciones = 10)
    {
        return db()->insert(
            "INSERT INTO AgentDistribution (id_usuario, max_conversaciones) 
             VALUES (?, ?)
             ON DUPLICATE KEY UPDATE max_conversaciones = ?, activo = 1",
            [$userId, $maxConversaciones, $maxConversaciones]
        );
    }

    /**
     * Desactivar agente del pool
     */
    public function removeAgent($userId)
    {
        db()->execute(
            "UPDATE AgentDistribution SET activo = 0 WHERE id_usuario = ?",
            [$userId]
        );
    }
}

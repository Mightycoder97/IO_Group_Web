import os
import re

FILES_TO_CLEAN = [
    r"c:\Users\sebas\Documents\IOGROUPWEB\landing\index.html",
    r"c:\Users\sebas\Documents\IOGROUPWEB\control\public\pages\prospectos\formulario.html",
    r"c:\Users\sebas\Documents\IOGROUPWEB\control\public\pages\prospectos\listar.html",
    r"c:\Users\sebas\Documents\IOGROUPWEB\control\public\pages\dashboard.html"
]

def clean_html_styles(file_path):
    try:
        if not os.path.exists(file_path):
            print(f"File not found: {file_path}")
            return

        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # Regex to remove <style>...</style> blocks
        # We use re.DOTALL to match newlines
        new_content = re.sub(r'<style>.*?</style>', '', content, flags=re.DOTALL)

        if new_content != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Cleaned styles from: {file_path}")
        else:
            print(f"No styles found in: {file_path}")

    except Exception as e:
        print(f"Error processing {file_path}: {e}")

if __name__ == "__main__":
    for file in FILES_TO_CLEAN:
        clean_html_styles(file)

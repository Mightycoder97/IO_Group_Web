import os
import re

PROJECT_ROOT = r"c:\Users\sebas\Documents\IOGROUPWEB"
GLOBAL_CSS_PATH = os.path.join(PROJECT_ROOT, "css", "global.css")

def update_html_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        original_content = content
        file_dir = os.path.dirname(file_path)
        
        # Calculate relative path to global.css
        try:
            rel_css_path = os.path.relpath(GLOBAL_CSS_PATH, file_dir)
            rel_css_path = rel_css_path.replace(os.path.sep, '/')
        except ValueError:
            print(f"Skipping {file_path}: Cannot calculate relative path.")
            return

        # Determine if it is a Control App file
        is_control_app = "control" in file_path.lower() and "public" in file_path.lower()

        # Update CSS Links
        # Regex to find style.css or styles.css or control styles
        # We look for <link ... href="...styles.css"...>
        
        def replace_css_link(match):
            # We replace the link href with the new global one
            # But we must preserve other attributes? 
            # Easier: Just replace the content of href.
            full_tag = match.group(0)
            if "newsletter-popup.css" in full_tag:
                return "" # Remove newsletter popup link as it is merged
            
            # Replace the href value
            new_tag = re.sub(r'href="[^"]*styles\.css"', f'href="{rel_css_path}"', full_tag)
            return new_tag

        # Find all link tags with .css
        new_content = re.sub(r'<link[^>]+href="[^"]+\.css"[^>]*>', replace_css_link, content)
        
        # Cleanup empty lines left by removal (optional, simple check)
        new_content = re.sub(r'\n\s*\n', '\n', new_content)

        # For Control App: Add body class
        if is_control_app:
            if "class=\"control-app\"" not in new_content and "class='control-app'" not in new_content:
                # Add class to body
                # Handle <body class="..."> and <body>
                if re.search(r'<body[^>]*class=["\'][^"\']*["\']', new_content):
                    # Append to existing class
                    new_content = re.sub(r'(<body[^>]*class=["\'])([^"\']*)(["\'])', r'\1\2 control-app\3', new_content)
                else:
                    # Add class attribute
                    new_content = re.sub(r'<body([^>]*)>', r'<body\1 class="control-app">', new_content)

        if new_content != original_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated: {file_path}")
        else:
            print(f"No changes: {file_path}")

    except Exception as e:
        print(f"Error processing {file_path}: {e}")

def main():
    for root, dirs, files in os.walk(PROJECT_ROOT):
        # Skip hidden folders
        if '.git' in root or 'vendor' in root:
            continue
            
        for file in files:
            if file.endswith(".html"):
                file_path = os.path.join(root, file)
                update_html_file(file_path)

if __name__ == "__main__":
    main()

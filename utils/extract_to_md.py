import os
import argparse

def extract(lst):
    output = ""
    for file_path in lst:
        # add file name as header
        output += file_path + "\n"
        
        # add code block according to language
        if file_path.endswith(".py"):
            output += "```python\n"
        else:
            output += "```\n"
            
        with open(file_path, "r") as f:
            output += f.read()
            
        output += "\n```\n\n"
        
    # save output to a file
    with open("output.md", "w") as f:
        f.write(output)
        

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Extract code from files")
    parser.add_argument("files", nargs="+", help="Files to extract code from")
    args = parser.parse_args()
    
    extract(args.files)

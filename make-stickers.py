import os 
import subprocess

IMG_PATH = "img"
STICKER_PATH = "sticker"

def make_latex_call(course_num, course_title_top, course_title_bottom, image_path, border_color, background_color, output_path, graphic_height = 0.75, bottom_text_height=0.5, graphic_vertical = 0.05):
    
    call = ["pdflatex"]
    call.append(f"-output-directory")
    call.append(f"{output_path}")
    
    tex_call = f"\\newcommand{{\coursenum}}[0]{{{course_num}}}"
    tex_call += f"\\newcommand{{\coursetitletop}}[0]{{{course_title_top}}}"
    
    tex_call += f"\\newcommand{{\coursetitlebottom}}[0]{{{course_title_bottom}}}"
    
    tex_call += f"\\newcommand{{\\bordercolor}}[0]{{{border_color}}}"
    
    tex_call += f"\\newcommand{{\\backgroundcolor}}[0]{{{background_color}}}"

    tex_call += f"\\newcommand{{\\imgpath}}[0]{{{image_path}}}"
    
    tex_call += f"\\newcommand{{\graphicheight}}[0]{{{graphic_height}}}"
    tex_call += f"\\newcommand{{\graphicvertical}}[0]{{{graphic_vertical}}}"
    tex_call += f"\\newcommand{{\\bottomtextheight}}[0]{{{bottom_text_height}}}"
    
    tex_call += f"\input{{stickers.tex}}"
    call.append(tex_call)
    return call


arg_dict = {
    "0702" : {
        "course_title_top" : "Senior Thesis",
        "course_title_bottom" : "",
        "border_color" : "873E23", 
        "bottom_text_height" : "0.57",
        "graphic_height" : "0.8",
        "graphic_vertical" : 0
        },
    "0451" : {
        "course_title_top" : "Machine",
        "course_title_bottom" : "Learning",
        "border_color" : "873E23", 
        "bottom_text_height" : "0.57",
        "graphic_height" : "0.8",
        "graphic_vertical" : 0
        },
    "0457" : {
        "course_title_top" : "Natural Language",
        "course_title_bottom" : "Processing",
        "border_color" : "873E23", 
        },
    "0302" : {
        "course_title_top" : "Algorithms and",
        "course_title_bottom" : "Complexity",
        "border_color" : "873E23", 
        },
    "0333" : {
        "course_title_top" : "Quantum",
        "course_title_bottom" : "Computing",
        "border_color" : "873E23", 
        },
    "0312" : {
        "course_title_top" : "Software",
        "course_title_bottom" : "Development",
        "border_color" : "873E23", 
        },
    "0301" : {
        "course_title_top" : "Theory of",
        "course_title_bottom" : "Computation",
        "border_color" : "873E23", 
        },
    "0202" : {
        "course_title_top" : "Computer",
        "course_title_bottom" : "Architecture",
        "border_color" : "873E23", 
        },
}




if __name__ == "__main__":
    
    top_dirs = os.listdir(IMG_PATH)
    top_dirs = [f for f in top_dirs if f != ".DS_Store"]
    
    for course in top_dirs:
        os.makedirs(f"{STICKER_PATH}/{course}", exist_ok = True)

        dirs = os.listdir(f"{IMG_PATH}/{course}")
        dirs = [f for f in dirs if f != ".DS_Store"]
        
        for i, img in enumerate(dirs):
            image_path  = f"{IMG_PATH}/{course}/{img}"
            output_path = f"{STICKER_PATH}/{course}"         
        
            args = arg_dict[course]

        
            call = make_latex_call(f"CSCI {course}", 
                                course_title_top = f"{args['course_title_top']}", 
                                course_title_bottom = f"{args['course_title_bottom']}", 
                                image_path = image_path, 
                                border_color = "873E23", 
                                background_color= "white", 
                                graphic_height = args.get("graphic_height", 0.75),
                                bottom_text_height=args.get("bottom_text_height", 0.5),
                                graphic_vertical=args.get("graphic_vertical", 0.05),
                                output_path=output_path)
            
            subprocess.run(call)
            
            os.rename(f"{output_path}/stickers.pdf", f"{output_path}/sticker-{i}.pdf")
        
    # for each course in the img path 
    #   create a directory in the sticker path
    #   for each submission in the course dir
    #       construct and execute a LaTeX call








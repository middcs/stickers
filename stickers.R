# for(package in c("hexSticker", "ggplot2", "showtext")){
#     if (!require(package)) install.packages(package)
# }


library(hexSticker)
library(ggplot2)
library(showtext)
library(magick)
library(palmerpenguins)
library(tidyverse)
library(colorspace)



sans_font  <- "Source Code Pro"
serif_font <- "Merriweather"

font_add_google(sans_font, sans_font)
font_add_google(serif_font, serif_font)

imgurl <- "img/background-network.png"

print(imgurl)

make_sticker_plain <- function(class_title, sans_font, serif_font, bg_color = "white", code_color = "black", name_color = "#0D395F", title = "plain"){

    p <- ggplot() 
    p <- p + theme_void() + theme_transparent()

    versions = c("student", "ta")
    borders  = c("darkgrey", "black")

    for(i in c(1, 2)){
        s <- sticker(p,
                 package=class_title,
                 p_color = code_color,
                 p_fontface = "bold", 
                 url = "Machine Learning",
                 u_angle = 0,
                 u_size = 12.5, 
                 u_color = name_color,
                 u_x=0.31, 
                 u_y=0.84,
                 p_size=22,
                 p_y = 1.1, 
                 s_x=1, 
                 s_y=2, 
                 s_width=2, 
                 s_height=2, 
                 h_fill = bg_color,
                 h_color = borders[i],
                 p_family = sans_font,
                 u_family = serif_font,
                 filename=paste0("stickers/", title, "-",versions[i], ".png"),
                 h_size = 1
                )
    }
}



make_sticker_image <- function(class_title, sans_font, serif_font){

    p <- ggplot(aes(x = mpg, y = wt), data = mtcars) + geom_point() + geom_smooth(se = FALSE)
    p <- p + theme_void() + theme_transparent()

    p <- "img/optimization.png"

    versions <- c("student", "ta")
    borders  <- c("darkgrey", "black")

    for(i in c(1, 2)){
        s <- sticker(p,
                 package=class_title,
                 p_fontface = "bold", 
                 url = "Machine Learning",
                 u_angle = 0,
                 u_size = 12.5, 
                 u_color = "#0D395F",
                 u_x=0.31, 
                 u_y=0.54,
                 p_size=20,
                 p_y = 1.4, 
                 s_x=1, 
                 s_y=0.95, 
                 s_width=0.7, 
                 s_height=0.3, 
                 h_fill = "white",
                 h_color = borders[i],
                 p_color = "black",
                 p_family = sans_font,
                 u_family = serif_font,
                 filename=paste0("stickers/image-",versions[i], ".png"),
                 h_size = 1
                )
    }
}


make_sticker_image_background <- function(class_title, sans_font, serif_font){

    sub <- penguins %>%
        filter(species != "Adelie")

    p <- ggplot(aes(x = bill_length_mm, 
                y = bill_depth_mm, 
                color = species, shape = species), 
                data = sub) +
        geom_point(alpha = 0.2) + 
        guides(color = "none", shape = "none") + 
        geom_abline(slope = 0.13, intercept = 10.5, color = "black", alpha = 0.2) + 
        scale_color_discrete_qualitative()


    p <- p + theme_void() + theme_transparent()

    versions <- c("student", "ta")
    borders  <- c("darkgrey", "black")

    for(i in c(1, 2)){
        s <- sticker(p,
                 package=class_title,
                 p_fontface = "bold", 
                 url = "Machine Learning",
                 u_angle = 0,
                 u_size = 12.5, 
                 u_color = "#0D395F",
                 u_x=0.31, 
                 u_y=0.54,
                 p_size=20,
                 p_y = 1.4, 
                 s_x = 1.1, 
                 s_y = 1,
                 s_width=2, 
                 s_height = 3, 
                 h_fill = "white",
                 h_color = borders[i],
                 p_color = "black",
                 p_family = sans_font,
                 u_family = serif_font,
                 filename=paste0("stickers/image-background-",versions[i], ".png"),
                 h_size = 1
                )
    }
}



make_sticker_image("CSCI 0451", sans_font, serif_font)
make_sticker_image_background("CSCI 0451", sans_font, serif_font)

make_sticker_plain("CSCI 0451", sans_font, serif_font)
make_sticker_plain("CSCI 0451", sans_font, serif_font, title = "dark", code_color = "white", bg_color = "darkslategrey", name_color = "white")

# Stickers! 

Code for generating stickers for CSCI courses at Middlebury College.

### To generate a new sticker

1. Create a new directory with a descriptive label, such as for a class or a club.
2. Into this repository, place a `sticker.tex` file. The easiest way to create such a file is by copying and pasting one from the directory of an existing course.
3. Place a `<image-name>.png` image in the same directory.
4. Edit the `sticker.tex` file. You will likely wish to edit the block of common arguments to your specifications, described below. You will also need to edit the `\includegraphics[height=0.8 in]{image.png}` call so that the `<image-name>.png` file is imported and that the height is correct. There are additional arguments related to the location of the image that you may also need to adjust. Trial-and-error is probably the best policy.
5. When you are ready to preview your sticker, render it by compiling `sticker.tex` using a local LaTeX installation. This will result in the generation of a file `sticker.pdf` which can then be purchased through a vendor. 

The block of common arguments is this one: 

```tex
\newcommand{\coursenum}[0]{CSCI XXXX}%
\newcommand{\coursetitletop}[0]{Course }%
\newcommand{\coursetitlebottom}[0]{Title}%
\newcommand{\bordercolor}[0]{5768D6}%
\newcommand{\backgroundcolor}[0]{white}%
```

### Vendor

Our current vendor is [Sticker Mule](https://www.stickermule.com/). Bulk orders should be prioritized through Sticker Mule, as there are major discounts associated both with ordering large quantities of the same sticker and with ordering different kinds of stickers at the same time.

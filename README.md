# Floyd–Steinberg dithering


Floyd–Steinberg dithering is an image dithering algorithm first published in 1976 by Robert W. Floyd and Louis Steinberg. It is commonly used by image manipulation software, for example when an image is converted into GIF format that is restricted to a maximum of 256 colors.

The algorithm achieves dithering using error diffusion, meaning it pushes (adds) the residual quantization error of a pixel onto its neighboring pixels, to be dealt with later. It spreads the debt out according to the distribution (shown as a map of the neighboring pixels) :

![error propogation](https://github.com/souravrane/Image-Dithering/blob/master/dithering_js/data/error_propogation.PNG)

<b> Original picture </b>

![original picture](https://github.com/souravrane/Image-Dithering/blob/master/dithering_js/data/original%20picture.PNG)

<b> Before dithering </b>

![before](https://github.com/souravrane/Image-Dithering/blob/master/dithering_js/data/before%20dithering.PNG)

<b> Floyd–Steinberg dithering </b>

![after](https://github.com/souravrane/Image-Dithering/blob/master/dithering_js/data/after%20dithering.PNG)




# germanic-syntax-slides

The German slides for my Germanic Syntax textbook / lecture

The book can be downloaded from my webpage: <a href="https://hpsg.hu-berlin.de/~stefan/Pub/germanic.html">https://hpsg.hu-berlin.de/~stefan/Pub/germanic.html</a>.

The tex-code should work with TeX live 2020.

In order to compile the slides, you have to put the files in the styles folder into your LaTeX path. The easiest way to do this is to include ./styles and everything below it into your tex path. For tcsh this works as follows:

  setenv TEXINPUTS .:./styles//:${TEXINPUTS}.:


To update submodules type:

git submodule foreach git pull
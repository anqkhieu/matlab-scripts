function idx = irisPredict (sl, sw, pl, pw)
    [slsetosaM, slversicolorM, slvirginicaM] = irisMean(1);
    [swsetosaM, swversicolorM, swvirginicaM] = irisMean(2);
    [plsetosaM, plversicolorM, plvirginicaM] = irisMean(3);
    [pwsetosaM, pwversicolorM, pwvirginicaM] = irisMean(4);
    [slsetosaS, slversicolorS, slvirginicaS] = irisStd(1);
    [swsetosaS, swversicolorS, swvirginicaS] = irisStd(2);
    [plsetosaS, plversicolorS, plvirginicaS] = irisStd(3);
    [pwsetosaS, pwversicolorS, pwvirginicaS] = irisStd(4);
    s = ((sl-slsetosaM)^2/slsetosaS)+((sw-swsetosaM)^2/swsetosaS)+((pl-plsetosaM)^2/plsetosaS)+((pw-pwsetosaM)^2/pwsetosaS);
    vs = ((sl-slversicolorM)^2/slversicolorS)+((sw-swversicolorM)^2/swversicolorS)+((pl-plversicolorM)^2/plversicolorS)+((pw-pwversicolorM)^2/pwversicolorS);
    vg = ((sl-slvirginicaM)^2/slvirginicaS)+((sw-swvirginicaM)^2/swvirginicaS)+((pl-plvirginicaM)^2/plvirginicaS)+((pw-pwvirginicaM)^2/pwvirginicaS);
    closeness = [s vs vg];
    [minimum, minindex] = min(closeness);
    idx = minindex
end
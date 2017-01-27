% Josh Liu ID: 260612384

function p = boltzprob(t, yp, y)
    p = exp(-(y - yp)/t);
end
function y = soft_T(x,alpha, beta)
[sx, sy] = size(x);
y = x;
for ii=1:sx
    for jj=1:sy
        if abs(y(ii,jj)) < beta
            y(ii,jj) = 0;
        elseif abs(y(ii,jj)) > alpha
            if abs(y(ii,jj))/10 > alpha
                y(ii,jj) = y(ii,jj)/(20*log10(abs(y(ii,jj))/alpha));
            else y(ii,jj) = y(ii,jj)/abs(y(ii,jj))*alpha;
            end
        end
    end
end
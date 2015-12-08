function P = collab_predict(S,R,n,u,k)
% S=similarity matrix for items (nxn)
% R=Ratings matrix with rows for users and cols for items (mxn)
% n=number of neighbors to look at
% the nearest n neighbors are those that are most similar to item i
% u=id's of users of interest
% k=id's of items of interest
% P=prediction of rating by users u for items k
% R = Y;
[~,r] = size(R);
meanR = R;
meanR(meanR==0) = NaN;
meanR = nanmean(meanR,2);
P = zeros(length(u),length(k));
for i=1:length(u)
    for j=1:length(k)
        if k(j)<r %check to make sure it's not a new item
            [sim,ind] = sort(S(:,k(j)),'descend'); %generate vector of similarities 
                                                    %for item k in descending order for items u(i) has rated
            P(i,j) = meanR(k(j))+sum((R(ind(2:n+1),u(i))-meanR(ind(2:n+1))).*sim(2:n+1))...
                /sum(abs(sim(2:n+1)));
        else
            %assign new item to cluster
            %generate similarity vector
            %calculate prediction using other eqn
        end
    end
    u(i)
end

end
function [ res ] = func_jacob_direct ( wu , wv , s )

U = angle_axis_depara( wu );
V = angle_axis_depara( wv );
sigma = deparameterization (s);

tmp11 = kron(eye(3),[-sigma(2)*V(:,2),sigma(1)*V(:,1),...
    (sigma(1)+sigma(2))/2*V(:,3);0,0,-1]);
tmp21 = [kron(eye(3),[sigma(1)*U(1,2),-sigma(2)*U(1,1),(sigma(1)+sigma(2))/2*U(1,3)]);...
    zeros(1,9);...
    kron(eye(3),[sigma(1)*U(2,2),-sigma(2)*U(2,1),(sigma(1)+sigma(2))/2*U(2,3)]);...
    zeros(1,9);...
    kron(eye(3),[sigma(1)*U(3,2),-sigma(2)*U(3,1),(sigma(1)+sigma(2))/2*U(3,3)]);...
    zeros(1,9)];
tmp31 = [U(1,2)*V(:,1)+U(1,3)/2*V(:,3),U(1,3)/2*V(:,3)-U(1,1)*V(:,2);...
    zeros(1,2);...
    U(2,2)*V(:,1)+U(2,3)/2*V(:,3),U(2,3)/2*V(:,3)-U(2,1)*V(:,2);...
    zeros(1,2);...
    U(3,2)*V(:,1)+U(3,3)/2*V(:,3),U(3,3)/2*V(:,3)-U(3,1)*V(:,2);...
    zeros(1,2)];

tmp12=jacobian_angle_axis(wu);
tmp22=jacobian_angle_axis(wv);
tmp32 = deriv_homo_vector( s );

res = [tmp11*tmp12 tmp21*tmp22 tmp31*tmp32];
end
%{
   Assuming Gaussian distributions, write your own code to compute the mean and
   variance for each of the two classes. Plot the Gaussian curves.
%}
[u_face, cov_face, u_non_face, cov_non_face] = get_mean_covar('G');

std_face = sqrt(cov_face);
std_non_face = sqrt(cov_non_face);

face = u_face - 4*std_face : std_face/100 : u_face + 4*std_face;
non_face = u_non_face - 4*std_non_face : std_non_face/100 : ...
           u_non_face + 4*std_non_face;

face_pdf = normpdf(face, u_face, std_face);
non_face_pdf = normpdf(non_face, u_non_face, std_non_face);

face_title = sprintf(['Gaussian distribution of skin pixels with mean %f ' ...
                      'and standard deviation %f'], u_face, std_face);
non_face_title = sprintf(['Gaussian distribution of non-skin pixels with ' ...
                          'mean %f and standard deviation %f'], u_non_face, ...
                         std_non_face);

figure(2);
subplot(121), plot(face, face_pdf), axis([0 1 0 20]), title('Skin')%, title(face_title);
subplot(122), plot(non_face, non_face_pdf), axis([0 1 0 20]), title('Non-skin')%, title(non_face_title);
pause

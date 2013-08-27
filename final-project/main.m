addpath('util');

[training_images, training_labels, images, labels] = get_images_and_labels();

pc = pca(training_images, 5);
pc2 = pca(images, 5);

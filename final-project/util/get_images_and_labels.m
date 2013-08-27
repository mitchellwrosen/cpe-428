function [training_images, training_labels, images, labels] = ...
      get_images_and_labels()

   training_images = loadMNISTImages('data/train-images-idx3-ubyte');
   training_labels = loadMNISTLabels('data/train-labels-idx1-ubyte');
   images = loadMNISTImages('data/t10k-images-idx3-ubyte');
   labels = loadMNISTLabels('data/t10k-labels-idx1-ubyte');

   % Change labels to class numbers.
   training_labels += 1;
   labels += 1;
end

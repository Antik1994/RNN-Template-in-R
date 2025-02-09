rm(list=ls())
# Load libraries
library(keras)
library(tensorflow)

# https://www.rdocumentation.org/packages/keras/versions/2.0.6/topics/dataset_imdb
# Load the IMDb dataset
imdb<-dataset_imdb(num_words=200)
x_train<-imdb$train$x
y_train<-imdb$train$y
x_text<-imdb$text$x
y_text<-imdb$text$y

x_train [1]
# Define the maximum sequence length and vocabulary size
max_sequence_length <-   # Truncate or pad sequences to this length
vocab_size <- 200

# Preprocess the data: pad sequences and perform one-hot encoding
x_train<-pad_sequences(x_train, maxlen = max_sequence_length)
X_test<-pad_sequences (x_test, maxlen = max_sequence_length)

# Perform one-hot encoding on the data
X_train<-keras::to_categorical (x_train, num_classes = vocab_size)
X_test<-keras ::to_catagorical (x_test,num_classes =vocab_size)

# Define the RNN model without layer_embedding
model<-keras_model_sequential() %>%
  layer_simple_rnn(units= 32,
                   input_shape=c(max_sequence_length, vocab_size)) %>%
  layer_dense (units =1, activation = 'sigmoid')
  

# compile the model
model %>% compile
  loss= 'binary_crossentropy'
  optimizer = optimizer_adam (learning_rate =2e-5),
  metrics =c ('accuracy')

# Define early stopping
early_stopping =callback_early_stopping(
  monitor = 'val_loss',
  patience =10,
  restore_best_weights=T)
  
  
# Train the model with early stopping
history<-model %>% fit (
  x_train,y_train,
  epochs= 1000,
  batch_size=128,
  validation_split=0.2,
  callback=list

# predict on holdout/test


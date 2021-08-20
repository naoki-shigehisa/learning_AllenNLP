// ハイパーパラメータを変数化する
local lr = std.parseJson(std.extVar('lr'));
local lstm_hidden_size = std.parseInt(std.extVar('lstm_hidden_size'));
local dropout = std.parseJson(std.extVar('dropout'));
local word_embedding_dim = std.parseInt(std.extVar('word_embedding_dim'));

{
  dataset_reader: {
    type: 'classification-csv',
    token_indexers: {
      word: {
        type: 'single_id',
      },
    },
  },
  train_data_path: '../data/anotated_tsubame_discriptions_for_train.csv',
  validation_data_path: '../data/anotated_tsubame_discriptions_for_val.csv',
  model: {
    type: 'crf_tagger',
    text_field_embedder: {
      type: 'basic',
      token_embedders: {
        word: {
          type: 'embedding',
          embedding_dim: word_embedding_dim,
        },
      },
    },
    encoder: {
      type: 'lstm',
      input_size: word_embedding_dim,
      hidden_size: lstm_hidden_size,
      dropout: dropout,
      bidirectional: true,
    },
    calculate_span_f1: false,
    dropout: dropout,
    initializer: {},
  },
  data_loader: {
    batch_size: 10,
  },
  trainer: {
    num_epochs: 20,
    cuda_device: -1,
    optimizer: {
      type: 'adam',
      lr: lr,
    },
  },
}
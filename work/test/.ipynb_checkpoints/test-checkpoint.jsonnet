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
  validation_data_path: '../data/anotated_tsubame_discriptions_for_train.csv',
  model: {
    type: 'crf_tagger',
    text_field_embedder: {
      type: 'basic',
      token_embedders: {
        word: {
          type: 'embedding',
          embedding_dim: 32,
        },
      },
    },
    encoder: {
      type: 'lstm',
      input_size: 32,
      hidden_size: 32,
      dropout: 0.5,
      bidirectional: true,
    },
    calculate_span_f1: false,
    dropout: 0.5,
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
      lr: 5e-4,
    },
  },
}
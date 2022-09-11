class Environment {
  Environment._();

  static const baseURL = String.fromEnvironment(
    'jsonplaceholder',
    defaultValue: 'https://jsonplaceholder.typicode.com',
  );

  static const users = String.fromEnvironment(
    'users',
    defaultValue: '/users',
  );

  static const todos = String.fromEnvironment(
    'todos',
    defaultValue: '/todos',
  );

  static const albums = String.fromEnvironment(
    'albums',
    defaultValue: '/albums',
  );
}

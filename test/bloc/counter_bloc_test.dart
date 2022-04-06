import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_testing/bloc/counter_bloc.dart';
import 'package:test/test.dart';

class MockCounterBloc extends MockBloc<CounterEvent, int>
    implements CounterBloc {}

void main() {
  group('Bloc Basic Testing', () {
    final counterBloc = MockCounterBloc();

    whenListen(
      counterBloc,
      Stream.fromIterable([0, 1, 2, 3]),
      initialState: 0,
    );
    test('initial state dari CounterCubit', () {
      expect(counterBloc.state, equals(0));
    });

    blocTest<CounterBloc, int>('test increment',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterIncremented()),
        expect: () => [1]);

    blocTest<CounterBloc, int>('test decrement',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterDecremented()),
        expect: () => [-1]);

    blocTest<CounterBloc, int>(
      'test increment 2 kali',
      build: () => CounterBloc(),
      act: (bloc) => bloc
        ..add(CounterIncremented())
        ..add(CounterIncremented()),
      skip: 1,
      expect: () => [2],
    );
  });
}

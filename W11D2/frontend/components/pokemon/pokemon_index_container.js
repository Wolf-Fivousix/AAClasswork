import { connect } from 'react-redux';
import selectAllPokemon from '../../reducers/selectors';
import { requestAllPokemon, requestAPoke } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = (state) => ({ // return an object
  pokemon: selectAllPokemon(state),
  errors: state.errors
});

const mapDispatchToProps = (dispatch) => ({ // will need our actions
  requestAllPokemon: () => dispatch(requestAllPokemon()),
  requestAPoke: () => dispatch(requestAPoke())
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);
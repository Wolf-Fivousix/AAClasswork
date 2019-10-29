import { RECEIVE_ALL_POKEMON } from "../actions/pokemon_actions";

export default pokemonReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type) {
    case (RECEIVE_ALL_POKEMON):
      return action.entities.pokemon;
    default:
      return state;
  }
};
import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECIEVE_A_POKE = "RECEIVE_A_POKE";

export const receiveAllPokemon = (pokemon) => { // plural 
  return (
    {
      type: RECEIVE_ALL_POKEMON,
      entities: pokemon
    }
  );
};

export const receiveAPoke = (poke) => {
  return ({
    type: RECEIVE_A_POKE,
    poke
  });
};

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);
export const requestAPoke = () => (dispatch) => (
  APIUtil.fetchAPoke()
    .then(pokemon => dispatch(receiveAPoke(pokemon)))
);
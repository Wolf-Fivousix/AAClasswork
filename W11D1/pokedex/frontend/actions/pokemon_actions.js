export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";

export function receiveAllPokemon(pokemon) { // plural 
  return (
    {
      type: RECEIVE_ALL_POKEMON,
      entities: pokemon
    }
  )
}
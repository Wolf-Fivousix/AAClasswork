import React from "react";
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    // debugger;
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    const pokemonItems = this.props.pokemon.map( (poke, idx) => (
      <PokemonIndexItem poke={poke} key={idx}/>
    ));

    return (
      <section className="pokedex">
        <ul>{pokemonItems}</ul>
      </section>
    );
  }
}
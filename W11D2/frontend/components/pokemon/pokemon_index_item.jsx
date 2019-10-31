import React from 'react';
import { Link } from "react-router-dom";


const PokemonIndexItem = ({ poke }) => (
  <li onClick={()=>(console.log(poke.id))}>
    <Link to="/pokemon/:pokemonId">
      {poke.name} 
      <img src={poke.image_url} width="30" heigth="30" />
    </Link>
    
  </li>
);

export default PokemonIndexItem;
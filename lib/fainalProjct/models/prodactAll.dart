import 'package:flutter/material.dart';

class ModelProduct {
  final String namePrdact;
  final String spuNames;
  final String photoProdact;
  final double price;
  final bool isFav;
  final String? discrbion;

  ModelProduct({
    required this.namePrdact,
    required this.spuNames,
    required this.photoProdact,
    this.price = 0,
    this.isFav = false,
    this.discrbion,
  });

  ModelProduct copyWith({
    String? namePrdact,
    String? spuNames,
    String? photoProdact,
    double? price,
    bool? isFav,
    String? discrbion,
  }) {
    return ModelProduct(
        namePrdact: namePrdact ?? this.namePrdact,
        spuNames: spuNames ?? this.spuNames,
        photoProdact: photoProdact ?? this.photoProdact,
        price: price ?? this.price,
        isFav: isFav ?? this.isFav,
        discrbion: discrbion ?? this.discrbion
    );
  }
}



List<ModelProduct> GearList = [
  ModelProduct(
    namePrdact: "PlayStation 5",
    spuNames: "Gaming Consoles",
    photoProdact: "images/Ps5.jpg",
    price: 499.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Xbox Series X",
    spuNames: "Gaming Consoles",
    photoProdact: "images/Xboxseris.jpg",
    price: 499.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Nintendo Switch",
    spuNames: "Portable Gaming",
    photoProdact: "images/HandGamis.jpg",
    price: 299.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Headset",
    spuNames: "Gaming Accessories",
    photoProdact: "images/maicro.jpg",
    price: 79.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Mechanical Keyboard",
    spuNames: "Gaming Accessories",
    photoProdact: "images/kybord.jpg",
    price: 129.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Mouse",
    spuNames: "Gaming Accessories",
    photoProdact: "images/maus.jpg",
    price: 59.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Chair",
    spuNames: "Gaming Furniture",
    photoProdact: "images/chos.jpg",
    price: 249.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "144Hz Gaming Monitor",
    spuNames: "Gaming Monitors",
    photoProdact: "images/144z.jpg",
    price: 299.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gift Cards",
    spuNames: "Gift Cards",
    photoProdact: "images/Control.jpg",
    price: 50.00,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Wireless Controller",
    spuNames: "Gaming Accessories",
    photoProdact: "images/pasCntrol.jpg",
    price: 69.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Webcam for Gaming",
    spuNames: "Streaming Accessories",
    photoProdact: "images/Camera.jpg",
    price: 89.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Microphone",
    spuNames: "Streaming Accessories",
    photoProdact: "images/MicrofoSmu.jpg",
    price: 99.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "PlayStation 4",
    spuNames: "Gaming Consoles",
    photoProdact: "images/ps4.jpg",
    price: 299.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Speakers",
    spuNames: "Audio Accessories",
    photoProdact: "images/Speker.jpg",
    price: 149.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Gaming Backpack",
    spuNames: "Accessories",
    photoProdact: "images/Bak.jpg",
    price: 49.99,
    isFav: false,
  ),
];

List<ModelProduct> GamesList = [
  ModelProduct(
    namePrdact: "Cyberpunk 2077",
    spuNames: "PC, PlayStation 5",
    photoProdact: "imegGames/Cyberpunk 2077.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "An action-adventure RPG set in the dystopian future of Night City. Explore a massive open world with deep character customization, hacking abilities, and a gripping story about technology and humanity.",
  ),
  ModelProduct(
    namePrdact: "The Last of Us Part II",
    spuNames: "PlayStation 5",
    photoProdact: "imegGames/The Last of Us Part II.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "A powerful narrative-driven game set in a post-apocalyptic world. Experience intense survival gameplay, emotional storytelling, and complex characters in this critically acclaimed sequel.",
  ),
  ModelProduct(
    namePrdact: "Halo Infinite",
    spuNames: "Xbox Series X, PC",
    photoProdact: "imegGames/Halo Infinite.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "Master Chief returns in this epic sci-fi shooter. Features an open-world environment, classic Halo combat, and a continuation of the iconic story in the Halo universe.",
  ),
  ModelProduct(
    namePrdact: "Elden Ring",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/Elden Ring.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "From the creators of Dark Souls comes this open-world fantasy RPG. Explore a vast, interconnected world filled with challenging enemies, deep lore, and rewarding exploration.",
  ),
  ModelProduct(
    namePrdact: "FIFA 24",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/FIFA24.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "The latest installment in the world's most popular football simulation. Features updated teams, enhanced graphics, new gameplay mechanics, and multiple game modes including Career and Ultimate Team.",
  ),
  ModelProduct(
    namePrdact: "God of War Ragnarök",
    spuNames: "PlayStation 5",
    photoProdact: "imegGames/God of War Ragnarök.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "Kratos and Atreus continue their journey through Norse mythology. Features visceral combat, a compelling father-son story, and stunning visuals set across the Nine Realms.",
  ),
  ModelProduct(
    namePrdact: "Call of Duty: Modern Warfare III",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/Call of Duty.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "The next chapter in the Modern Warfare series. Includes a cinematic single-player campaign, extensive multiplayer modes, and cooperative Zombies gameplay with modern graphics and mechanics.",
  ),
  ModelProduct(
    namePrdact: "The Legend of Zelda",
    spuNames: "Nintendo Switch",
    photoProdact: "imegGames/The Legend of Zelda Tears of the Kingdom.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "Link returns to Hyrule in this expansive sequel to Breath of the Wild. Features new abilities, sky islands to explore, and deep physics-based puzzles in a massive open world.",
  ),
  ModelProduct(
    namePrdact: "Starfield",
    spuNames: "PC, Xbox Series X",
    photoProdact: "imegGames/Starfield.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "Bethesda's first new universe in 25 years. Explore over 1,000 planets, engage in space combat, and create your own story in this epic science-fiction role-playing adventure.",
  ),
  ModelProduct(
    namePrdact: "Spider-Man 3",
    spuNames: "PlayStation 5",
    photoProdact: "imegGames/Spider-Man 3.jpeg",
    price: 69.99,
    isFav: false,
    discrbion: "Swing through a detailed recreation of New York City as Spider-Man. Features enhanced web-swinging mechanics, new villains, and an expanded story with multiple playable characters.",
  ),
  ModelProduct(
    namePrdact: "Assassin's Creed Mirage",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/Assassin's Creed Mirage.jpeg",
    price: 49.99,
    isFav: false,
    discrbion: "Return to the series' roots with this stealth-focused adventure set in 9th-century Baghdad. Features parkour, assassination contracts, and a narrative-driven experience about becoming an assassin.",
  ),
  ModelProduct(
    namePrdact: "Forza Horizon 5",
    spuNames: "PC, Xbox Series X",
    photoProdact: "imegGames/Forza Horizon 5.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "Race across a beautiful open world set in Mexico. Features over 500 cars, dynamic seasons, and endless racing events in one of the most visually stunning racing games ever made.",
  ),
  ModelProduct(
    namePrdact: "Minecraft",
    spuNames: "PC, PlayStation, Xbox, Nintendo Switch",
    photoProdact: "imegGames/Minecraft.jpeg",
    price: 29.99,
    isFav: false,
    discrbion: "The ultimate sandbox building game. Explore infinite worlds, gather resources, craft tools, and build anything you can imagine in both creative and survival modes with friends.",
  ),
  ModelProduct(
    namePrdact: "Grand Theft Auto V",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/Grand Theft Auto V.jpeg",
    price: 39.99,
    isFav: false,
    discrbion: "Experience the massive open world of Los Santos and Blaine County. Play as three unique characters in a story of crime and ambition, or explore the continuously updated GTA Online multiplayer world.",
  ),
  ModelProduct(
    namePrdact: "Resident Evil 4 Remake",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "imegGames/Resident Evil 4 Remake.jpeg",
    price: 59.99,
    isFav: false,
    discrbion: "A complete reimagining of the classic survival horror game. Features modernized controls, stunning graphics, expanded story elements, and intense combat against terrifying enemies.",
  ),
];

List<ModelProduct> UpcomingGamesList = [
  ModelProduct(
    namePrdact: "Grand Theft Auto VI",
    spuNames: "PlayStation 5, Xbox Series X",
    photoProdact: "",
    price: 79.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "The Elder Scrolls VI",
    spuNames: "PC, Xbox Series X",
    photoProdact: "",
    price: 69.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Fable",
    spuNames: "PC, Xbox Series X",
    photoProdact: "",
    price: 59.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Final Fantasy XVI",
    spuNames: "PlayStation 5",
    photoProdact: "",
    price: 69.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Hollow Knight: Silksong",
    spuNames: "PC, PlayStation 5, Xbox Series X, Nintendo Switch",
    photoProdact: "",
    price: 39.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Star Wars: Outlaws",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "",
    price: 69.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Avowed",
    spuNames: "PC, Xbox Series X",
    photoProdact: "",
    price: 59.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Suicide Squad",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "",
    price: 69.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Persona 6",
    spuNames: "PlayStation 5",
    photoProdact: "",
    price: 59.99,
    isFav: false,
  ),
  ModelProduct(
    namePrdact: "Dragon Age: Dreadwolf",
    spuNames: "PC, PlayStation 5, Xbox Series X",
    photoProdact: "",
    price: 69.99,
    isFav: false,
  ),
];




List<ModelProduct>allList=[
  ...GearList,
  ... GamesList,
  ... UpcomingGamesList
];
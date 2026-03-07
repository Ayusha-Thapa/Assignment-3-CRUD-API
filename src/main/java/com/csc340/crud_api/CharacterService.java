package com.csc340.crud_api;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CharacterService {

    private final CharacterRepository characterRepository;

    public CharacterService(CharacterRepository characterRepository) {
        this.characterRepository = characterRepository;
    }

    public List<Character> getAllCharacters() {
        return characterRepository.findAll();
    }

    public Character createCharacter(Character character) {
        return characterRepository.save(character);
    }

    public Character getCharacterById(Long id) {
        return characterRepository.findById(id).orElse(null);
    }

    public Character updateCharacter(Long id, Character updatedCharacter) {
        return characterRepository.findById(id)
                .map(character -> {
                    character.setName(updatedCharacter.getName());
                    character.setDescription(updatedCharacter.getDescription());
                    character.setHouse(updatedCharacter.getHouse());
                    character.setBloodStatus(updatedCharacter.getBloodStatus());
                    character.setAllegiance(updatedCharacter.getAllegiance());
                    character.setImageUrl(updatedCharacter.getImageUrl());
                    return characterRepository.save(character);
                })
                .orElse(null);
    }

    public boolean deleteCharacter(Long id) {
        if (characterRepository.existsById(id)) {
            characterRepository.deleteById(id);
            return true;
        }
        return false;
    }

    public List<Character> getCharactersByHouse(String house) {
        return characterRepository.findByHouse(house);
    }

    public List<Character> searchCharactersByName(String name) {
        return characterRepository.findByName(name);
    }
}
package com.csc340.crud_api;

import java.util.Collection;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/characters")
public class CharacterApiController {

    private final CharacterService characterService;

    public CharacterApiController(CharacterService characterService) {
        this.characterService = characterService;
    }

    /**
     * Endpoint to retrieve all characters.
     *
     * @return ResponseEntity containing a collection of all characters.
     */
    @GetMapping("/")
    public ResponseEntity<Collection<Character>> getAllCharacters() {
        return ResponseEntity.ok(characterService.getAllCharacters());
    }

    /**
     * Endpoint to retrieve a character by ID.
     *
     * @param id The ID of the character to retrieve.
     * @return ResponseEntity containing the character if found, or 404 if not found.
     */
    @GetMapping("/{id}")
    public ResponseEntity<Character> getCharacterById(@PathVariable Long id) {
        Character character = characterService.getCharacterById(id);
        if (character != null) {
            return ResponseEntity.ok(character);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Endpoint to create a new character.
     *
     * @param character The character object provided in the request body.
     * @return ResponseEntity containing the created character.
     */
    @PostMapping("/")
    public ResponseEntity<Character> createCharacter(@RequestBody Character character) {
        Character createdCharacter = characterService.createCharacter(character);
        if (createdCharacter != null) {
            return ResponseEntity.ok(createdCharacter);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Endpoint to update an existing character by ID.
     *
     * @param id The ID of the character to update.
     * @param updatedCharacter The updated character object.
     * @return ResponseEntity containing the updated character or 404 if not found.
     */
    @PutMapping("/{id}")
    public ResponseEntity<Character> updateCharacter(@PathVariable Long id, @RequestBody Character updatedCharacter) {
        Character character = characterService.updateCharacter(id, updatedCharacter);
        if (character != null) {
            return ResponseEntity.ok(character);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Endpoint to delete a character by ID.
     *
     * @param id The ID of the character to delete.
     * @return ResponseEntity with no content if deleted, or 404 if not found.
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {
        boolean deleted = characterService.deleteCharacter(id);
        if (deleted) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Endpoint to retrieve all characters of a given category.
     * For this API, category is house.
     *
     * Example: /api/characters/category/Gryffindor
     *
     * @param category The house/category to filter by.
     * @return ResponseEntity containing matching characters.
     */
    @GetMapping("/category/{category}")
    public ResponseEntity<Collection<Character>> getCharactersByCategory(@PathVariable String category) {
        return ResponseEntity.ok(characterService.getCharactersByHouse(category));
    }

    /**
     * Endpoint to search for characters by name.
     * If name is provided, return matching characters.
     * If name is not provided, return all characters.
     *
     * Example: /api/characters/search?name=harry
     *
     * @param name The name substring to search for.
     * @return ResponseEntity containing matching characters.
     */
    @GetMapping("/search")
    public ResponseEntity<Collection<Character>> searchCharactersByName(@RequestParam(required = false) String name) {
        List<Character> characters;
        if (name != null) {
            characters = characterService.searchCharactersByName(name);
        } else {
            characters = characterService.getAllCharacters();
        }
        return ResponseEntity.ok(characters);
    }
}
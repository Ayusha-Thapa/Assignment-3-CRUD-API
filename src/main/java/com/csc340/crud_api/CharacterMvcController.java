package com.csc340.crud_api;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

public class CharacterMvcController {
    private final CharacterService characterService;

    public CharacterMvcController(CharacterService characterService) {
        this.characterService = characterService;
    }

    @GetMapping("/characters/search")
    public String searchCharacters(@RequestParam(required = false) String name, Model model) {
        List<Character> characters;

        if (name != null && !name.isEmpty()) {
            characters = characterService.searchCharactersByName(name);
        } else {
            characters = characterService.getAllCharacters();
        }

        model.addAttribute("characters", characters);
        return "character-list";
    }

    @GetMapping("/characters/house/{house}")
    public String getByHouse(@PathVariable String house, Model model) {
        List<Character> characters = characterService.getCharactersByHouse(house);
        model.addAttribute("characters", characters);
        return "character-list";
    }

    @ModelAttribute("allCharacters")
    public List<Character> allCharacters() {
        return characterService.getAllCharacters();
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/characters")
    public String getAllCharacters(Model model) {
        model.addAttribute("characters", characterService.getAllCharacters());
        return "character-list";
    }

    @GetMapping("/character/{id}")
    public String getCharacterById(@PathVariable Long id, Model model) {
        Character character = characterService.getCharacterById(id);

        if (character != null) {
            model.addAttribute("character", characterService.getCharacterById(id));
            return "character-details";
        } else {
            return "error";
        }
    }

    @GetMapping("/character/create")
    public String showCreateForm() {
        return "character-create";
    }

    @PostMapping("/character/create")
    public String createCharacter(Character character, Model model) {

        if (character.getName() == null || character.getName().isEmpty()) {
            model.addAttribute("error", "Name is required");
            return "character-create";
        }

        characterService.createCharacter(character);
        return "redirect:/characters";
    }

    @GetMapping("/character/delete/{id}")
    public String deleteCharacter(@PathVariable Long id) {
        characterService.deleteCharacter(id);
        return "redirect:/characters";
    }

    @GetMapping("/character/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Character character = characterService.getCharacterById(id);
        model.addAttribute("character", character);
        return "character-edit";
    }

    @GetMapping("/character/update/{id}")
    public String updateCharacter(@PathVariable Long id, @ModelAttribute Character updatedCharacter) {
       characterService.updateCharacter(id, updatedCharacter);
       return "redirect:/characters"; 
    }
}

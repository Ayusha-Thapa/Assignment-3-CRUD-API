package com.csc340.crud_api;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "characters")
public class Character {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long characterId;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private String house;

    @Column(nullable = false)
    private String bloodStatus;

    private String allegiance;
    private String imageUrl;

    public Character() {
    }

    public Character(String name, String description, String house, String bloodStatus, String allegiance, String imageUrl) {
        this.name = name;
        this.description = description;
        this.house = house;
        this.bloodStatus = bloodStatus;
        this.allegiance = allegiance;
        this.imageUrl = imageUrl;
    }

    public Character(Long characterId, String name, String description, String house, String bloodStatus, String allegiance, String imageUrl) {
        this.characterId = characterId;
        this.name = name;
        this.description = description;
        this.house = house;
        this.bloodStatus = bloodStatus;
        this.allegiance = allegiance;
        this.imageUrl = imageUrl;
    }

    public Long getCharacterId() {
        return characterId;
    }

    public void setCharacterId(Long characterId) {
        this.characterId = characterId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getBloodStatus() {
        return bloodStatus;
    }

    public void setBloodStatus(String bloodStatus) {
        this.bloodStatus = bloodStatus;
    }

    public String getAllegiance() {
        return allegiance;
    }

    public void setAllegiance(String allegiance) {
        this.allegiance = allegiance;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
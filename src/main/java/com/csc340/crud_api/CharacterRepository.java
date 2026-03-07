package com.csc340.crud_api;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CharacterRepository extends JpaRepository<Character, Long> {

    List<Character> findByHouse(String house);

    @Query(value = "SELECT c.* FROM characters c WHERE c.name ILIKE %?1%", nativeQuery = true)
    List<Character> findByName(String name);
}
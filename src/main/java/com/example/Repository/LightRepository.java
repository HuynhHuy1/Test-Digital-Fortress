package com.example.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.Model.LightModel;

@Repository
public interface LightRepository extends JpaRepository<LightModel, Integer> {
    @Query("SELECT light FROM LightModel light WHERE light.roomid = :roomId ORDER BY " +
            "CASE light.color " +
            "WHEN 'red' THEN 1 " +
            "WHEN 'orange' THEN 2 " +
            "WHEN 'yellow' THEN 3 " +
            "WHEN 'green' THEN 4 " +
            "WHEN 'blue' THEN 5 " +
            "WHEN 'indigo' THEN 6 " +
            "WHEN 'violet' THEN 7 " +
            "ELSE 8 " +
            "END")
    List<LightModel> findByRoomIdOrderByRainbowColor(int roomId);
}

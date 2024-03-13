package com.example.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.Model.LightModel;
import com.example.Repository.LightRepository;

import java.util.ArrayList;
import java.util.List;

@RestController
public class HomeController {
    @Autowired
    LightRepository lightRepository;
    // url ex: http://localhost:8080/calculate-lights?lightBrightnessList=200,300,600,700&expectedBrightness=700
    @GetMapping("/calculate-lights")
    public List<List<Integer>> calculateLights(@RequestParam List<Integer> lightBrightnessList,
            @RequestParam int expectedBrightness) {
        List<List<Integer>> result = new ArrayList<>();
        calculateLightsHelper(lightBrightnessList, expectedBrightness, 0,
                new ArrayList<>(), result);
        return result;
    }

    
    // url ex: http://localhost:8080/get-lights?roomid=2
    @GetMapping("/get-lights")
    public List<LightModel> calculateLights2(@RequestParam int roomid) {
        List<LightModel> result = new ArrayList<>();
        List<LightModel> lights = lightRepository.findByRoomIdOrderByRainbowColor(roomid);
        for (LightModel light : lights) {
            result.add(new LightModel(light.getId(),light.getColor(),light.getBrightness(),light.getStatus(),light.getRoomid()));
        }
        return result;
    }

    private void calculateLightsHelper(List<Integer> lightBrightnessList, int expectedBrightness, int index,
            List<Integer> currentSetup, List<List<Integer>> result) {
        if (expectedBrightness == 0) {
            result.add(new ArrayList<>(currentSetup));
            return;
        }
        if (index == lightBrightnessList.size() || expectedBrightness < 0) {
            return;
        }
        for (int i = index; i < lightBrightnessList.size(); i++) {
            int brightness = lightBrightnessList.get(i);
            currentSetup.add(brightness);
            calculateLightsHelper(lightBrightnessList, expectedBrightness - brightness, i, currentSetup, result);
            currentSetup.remove(currentSetup.size() - 1);
        }
    }
}

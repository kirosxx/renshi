package com.jbssm.service;

import com.jbssm.domain.Meritsifo;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface MeritsifoService {

    public List<Meritsifo> findAllMeritsifo();

    public void addMeritsifo(Meritsifo meritsifo);

    public void deleteMeritsifo(int id);

    public Meritsifo findByid(int id);

    public void updateMeritsifo(Meritsifo meritsifo);

    public List<Meritsifo> findByCondition(String eno,String date);


}

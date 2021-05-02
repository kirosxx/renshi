package com.jbssm.service.impl;

import com.jbssm.dao.MeritsifoDao;
import com.jbssm.domain.Meritsifo;
import com.jbssm.service.MeritsifoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MeritsifoServiceImpl implements MeritsifoService {

    @Autowired
    private MeritsifoDao meritsifoDao;

    @Override
    public List<Meritsifo> findAllMeritsifo() {

        return meritsifoDao.findAllMeritsifo();
    }

    @Override
    public void addMeritsifo(Meritsifo meritsifo) {

        meritsifoDao.addMeritsifo(meritsifo);
    }

    @Override
    public void deleteMeritsifo(int id) {

        meritsifoDao.deleteMeritsifo(id);
    }

    @Override
    public Meritsifo findByid(int id) {

        return meritsifoDao.findById(id);
    }

    @Override
    public void updateMeritsifo(Meritsifo meritsifo) {

        meritsifoDao.updateMeritsifo(meritsifo);
    }

    @Override
    public List<Meritsifo> findByCondition(String eno, String date) {

        return meritsifoDao.findByCondition(eno,date);
    }
}

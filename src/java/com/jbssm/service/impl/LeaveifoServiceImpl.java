package com.jbssm.service.impl;

import com.jbssm.dao.LeaveifoDao;
import com.jbssm.dao.MeritsifoDao;
import com.jbssm.domain.Leaveaapli;
import com.jbssm.domain.Leaveifo;
import com.jbssm.domain.Meritsifo;
import com.jbssm.service.LeaveifoService;
import com.jbssm.service.MeritsifoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveifoServiceImpl implements LeaveifoService {

    @Autowired
    private LeaveifoDao leaveifoDao;

    @Override
    public List<Leaveifo> findAllLeaveifo() {

        return leaveifoDao.findAllLeaveifo();
    }

    @Override
    public List<Leaveaapli> findAllLeaveappli() {
        return leaveifoDao.findAllLeaveappli();
    }

    @Override
    public void addLeaveifo(Leaveifo leaveifo) {

        leaveifoDao.addleaveifo(leaveifo);
    }

    @Override
    public void ygleaveappli(Leaveaapli leaveaapli) {

        leaveifoDao.ygleaveappli(leaveaapli);
    }

    @Override
    public void deleteLeaveifo(int id) {

        leaveifoDao.deleteleaveifo(id);
    }

    @Override
    public void disagreeLeaveappli(int id, String agreer) {

        leaveifoDao.disagreeLeaveappli(id,agreer);
    }

    @Override
    public void agreeLeaveappli(int id, String agreer) {

        leaveifoDao.agreeLeaveappli(id,agreer);
    }

    @Override
    public Leaveifo findByid(int id) {

        return leaveifoDao.findById(id);
    }

    @Override
    public Leaveaapli findLeaveappliById(int id) {
        return leaveifoDao.findLeaveappliById(id);
    }

    @Override
    public void updateLeaveifo(Leaveifo leaveifo) {

        leaveifoDao.updateLeaveifo(leaveifo);
    }

    @Override
    public List<Leaveifo> findByCondition(String eno, String startdate,String enddate) {

        return leaveifoDao.findByCondition(eno,startdate,enddate);
    }
}

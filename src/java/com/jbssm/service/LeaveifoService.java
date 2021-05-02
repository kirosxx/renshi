package com.jbssm.service;

import com.jbssm.domain.Leaveaapli;
import com.jbssm.domain.Leaveifo;
import com.jbssm.domain.Meritsifo;

import java.util.List;


public interface LeaveifoService {

    public List<Leaveifo> findAllLeaveifo();

    public List<Leaveaapli> findAllLeaveappli();

    public void addLeaveifo(Leaveifo leaveifo);

    public void ygleaveappli(Leaveaapli leaveaapli);

    public void deleteLeaveifo(int id);

    public void disagreeLeaveappli(int id,String agreer);

    public void agreeLeaveappli(int id,String agreer);

    public Leaveifo findByid(int id);

    public Leaveaapli findLeaveappliById(int id);

    public void updateLeaveifo(Leaveifo leaveifo);

    public List<Leaveifo> findByCondition(String eno, String startdate,String enddate);


}

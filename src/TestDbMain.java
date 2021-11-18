import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import dao.DCandidate;
import dao.DCandidateSkill;
import dao.DEmployer;
import dao.DJobApplied;
import dao.DJobSkill;
import pojo.Candidate;
import pojo.CandidateSkill;
import pojo.Employer;
import pojo.JobApplied;
import pojo.JobSkill;

public class TestDbMain {

	public static void main(String[] args) {

//		DEmployer dEmployer = new DEmployer();
//		System.out.println(dEmployer.ping("deepanshu1297@gmail.com")+" emp");
//
//		DCandidate dCandidate = new DCandidate();
//		System.out.println(dCandidate.ping("deepanshu1297@gmail.com")+" can");
		
//		DCandidate dcandidate = new DCandidate();
//		a<Candidate> fetch = dcandidate.fetch("deepanshu1297@gmail.com");
//		for (Candidate c : fetch)System.out.print(c.getCandidate_id()+" "+c.getSelf_discription()+" "+c.getUpi_id());
//		System.out.println("inside main");
		
//		DCandidateSkill dCandidateSkill = new DCandidateSkill();
//		a<CandidateSkill> fetch = dCandidateSkill.fetch(23);
//		int size = fetch.get(0).getSkills().length;
//		System.out.println(size);
//		String[] s= new String[size];
//		for(int i=0;i<size;i++)s[i]= fetch.get(0).getSkills()[i];
//		for(int i=0;i<size;i++)System.out.println(s[i]);

//		StringBuffer str= new StringBuffer("");
//		for(int i=0;i<size;i++) {
//			if(i!=0)str.append(" or");
//			str.append(" skill="+s[i]);
//		}
//		System.out.println(str);
//		
//		DEmployer dEmployer = new DEmployer();
//		a<Employer> apply = dEmployer.apply(22);
		
//		for(Employer e:apply) {
//			System.out.println(e.getEmail());
//			System.out.println(e.getJob_discription());
//			System.out.println(e.getJob_id());
//			System.out.println(e.getJob_title());
//			System.out.println(e.getPayment_method());
//			System.out.println(e.getWages_daily());
//			System.out.println(e.getWages_monthly());
//			System.out.println(e.getDate_to());
//			System.out.println(e.getDate_from());
//			System.out.println("____________________________________________________");
//		}
		
//		a<Object> a = new a<Object>();
//		
//		Object integer=new Integer(10);
//		Object string = new String("hello");
//		a.add(integer);
//		a.add(string);
//
//		for(Object o:a) {
//			
//		}
		
//		a<Employer> applied= new a<Employer>();
//		DEmployer demployer=new DEmployer();
//		applied=demployer.apply(1);	
//		for(Employer e:applied){
//			System.out.println(e.getEmail());
//		}
		
//		DJobApplied d = new DJobApplied();
//		a<Employer> fetchPending = d.fetchPending(1);
//		System.out.println(fetchPending.get(0).getJob_title());
//		
//		for(int i=0;i<3; i++)for(int j=0;j<4;j++)System.out.println(j);
		
//		ArrayList<Integer> a = new ArrayList<Integer>();
//		a.add(1);
//		a.add(2);
//		a.add(4);
//		a.add(3);
//		a.add(8);
//		System.out.println(a);
//		a.remove(0);
//		System.out.println(a);
//		System.out.println(a.get(0));
//		
//		DCandidateSkill d = new DCandidateSkill();
//		ArrayList<CandidateSkill> show = d.fetch(1);
//		for(int i=0;i<show.get(0).getSkills().length;i++) {
//			System.out.println(show.get(0).getSkills()[i]);
//		}
		
//		ArrayList<Integer> b = new ArrayList<Integer>();
//		b.add(4);
//		b.add(2);
//
//		for(int i=0;i<b.size(); i++)for(int j=0;j<a.size();j++) {
//			if(a.get(j)==b.get(i))a.remove(j);
//		}
//		
//		System.out.println(a);
//		Map<String, String> hashMap = new DJobApplied().allCandidate(1);
//		 for (Entry<String, String> me : hashMap.entrySet()) {
//	            System.out.print(me.getKey() + ":");
//	            System.out.println(me.getValue());
//	        }
//		DEmployer demployer=new DEmployer();
//		ArrayList<Integer> jobId = demployer.jobId("En18cs301076@medicaps.ac.in");
//		for(int i:jobId) System.out.println(i);
		
//		DJobSkill d= new DJobSkill();
//		JobSkill f = d.fetchSkill(1);
//		for(String s:f.getSkills())System.out.println(s);
		
//		ArrayList<Integer> list=new  ArrayList<Integer>();
//		list.add(5);
//		list.add(7);
//		list.add(7);
//		list.add(6);
//		list.add(6);
//		list.add(5);
//		System.out.println(list);
//		list= (ArrayList<Integer>) list.stream().distinct().collect(Collectors.toList());
//		System.out.println(list);
		
//		ArrayList<Integer> a= new ArrayList<Integer>();
//		a.add(78);
//		a.add(85);
//		
//		ArrayList<ArrayList<Integer>> lists=new ArrayList<ArrayList<Integer>>();
//		lists.add(a);
//		lists.add(list);
//		for(ArrayList<Integer> a1:lists)
//			for(int i:a1)System.out.println(i);
		
		
//		System.out.println(new int[] {5,4,7,6,3}.toString());
//		JobSkill fetchSkill = d.fetchSkill(6);
//		String skillsToString = d.skillsToString(fetchSkill);
//		System.out.println(skillsToString);
		
//		System.out.println(d.candidateSkillToString(d.fetch(8)));
		
//		DJobApplied d = new DJobApplied();
//		Map<String, String> hashMap = d.allCandidate(5);
//		for (Entry<String, String> me : hashMap.entrySet()) {
//            System.out.print(me.getKey() + ":");
//            System.out.println(me.getValue());
//        }
		
	}

}
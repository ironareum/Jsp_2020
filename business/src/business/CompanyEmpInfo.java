package business;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

class Employee{
	String name ;
	String dept ;
	String adds ;
	String bday ;
	
	public Employee(String name, String dept, String adds, String bday) {
		this.name = name;
		this.dept = dept;
		this.adds = adds;
		this.bday = bday;
	}
	
	public void getEmpl() {
		System.out.println(this);
	}
	
	public String toString() {
		return "이름: "+ this.name + "\n부서: "+ this.dept + "\n주소: "+ this.adds + "\n생일: "+this.bday+"\n";
	}
	
}

class EmplsList{
	ArrayList<Employee> emplList = new ArrayList<>();
	
	public void addEmpl(Employee empl) {
		emplList.add(empl);
	}
	
	public void searchEmpl(String name) {
		Iterator<Employee> it = emplList.iterator();
		while(it.hasNext()) {
			Employee empl =(Employee)it.next();
			if(name.equals(empl.name)) {
				empl.getEmpl();
			}
		}
	}

	public void search() {
		boolean run = true;
		while(run) {
		System.out.println("원하시는 번호를 입력하세요 : \n");
		String[] menu = {"1. 등록", "2. 검색", "3. 종료"};
		for(String m : menu) {
			System.out.println(m);
		}	
		System.out.println();
		
		Scanner scan = new Scanner(System.in);
		int num = Integer.parseInt(scan.next());
		
		switch(num) {
		case 1:
			System.out.print("등록할 직원의 이름을 입력하세요 : ");
			String name_ = scan.next();
			System.out.print("등록할 직원의 부서를 입력하세요 : ");
			String dept_ = scan.next();
			System.out.print("등록할 직원의 주소를 입력하세요 : ");
			String adds_ = scan.next();
			System.out.print("등록할 직원의 생일을 입력하세요 : ");
			String bday_ = scan.next();
			System.out.println();
			Employee person = new Employee(name_, dept_, adds_, bday_);
			addEmpl(person);
			break;
			
		case 2: 
			System.out.print("찾으려는 직원의 이름을 읿력하세요 : ");
			String searchName = scan.next();
			System.out.println();
			System.out.println("==== 직원정보 ==== ");
			searchEmpl(searchName);
			break;
			
		case 3: 
			System.out.println("프로그램 종료. BYE ==33");
			run = false;
			break;
		

		}
		}
	}
}


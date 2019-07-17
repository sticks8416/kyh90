package chap06;

public class ImplCalculator implements Calculator{
	@Override
	public long factorial(long num) {
		long start = System.currentTimeMillis();
		long result = 1;
		for(int i =1; i<=num; i++) {
			result *=i;
			
		}
		long end = System.currentTimeMillis();
		System.out.printf(
				"ImplCalculator.factorial(%d) 수행 시간 : %d\n",
				num, (end-start));
		return result;
	}

}

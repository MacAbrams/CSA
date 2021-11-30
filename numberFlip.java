import java.util.*;

class numberFlip{
	
	public static void main(String[] args){

		Scanner sc = new Scanner(System.in);
		System.out.println("Input number of digits:");
		int n = sc.nextInt();
		int[] pair = new int[7];
		pair[0]=0;
		pair[1]=1;
		pair[2]=2;
		pair[3]=5;
		pair[4]=6;
		pair[5]=8;
		pair[6]=9;
		int[] pair2 = new int[7];
		pair2[0]=0;
		pair2[1]=1;
		pair2[2]=5;
		pair2[3]=2;
		pair2[4]=9;
		pair2[5]=8;
		pair2[6]=6;
		String self = "018";

		int side = (int)n/2;
		int comb = (int)Math.pow(7,side);
		int offset=1;
		if(n%2==1){
			comb*=3;
			offset=3;
		}
		//System.out.println(comb);


		int i= 0;
			

		while(i<comb){
			String trinaryString =Integer.toString((int)i/offset,7);
			String singleOut= "";
			//for
			if(offset==3){
				singleOut = self.substring(i%3,i%3+1); 
			}
			for(int inc=0;inc<trinaryString.length();inc++){
				singleOut = singleOut+pair2[ Integer.valueOf(  trinaryString.substring(inc,inc+1) )];
				singleOut = pair[Integer.valueOf(trinaryString.substring(inc,inc+1))]+singleOut;
			}
			System.out.println(singleOut);
			i++;
		}

		//System.out.println(Integer.toString(n,3));




	}



}
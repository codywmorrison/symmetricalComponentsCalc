#  Ruby - Calculating Symmetrical Components in an unbalanced
#  and balanced 3-phase system.
#  Balanced: Va = 230<0, Vb = 230<120, Vc = 230<240
#  Unbalanced: Va = 215<6, Vb = 232<126, Vc = 216<228
#  This script was created and written as an excercise in learning Ruby
#    
#  By Cody Morrison
#  31/12/23

require 'matrix'

class StdClass

	#-Input of balanced 3ph volt-#
	Va = Complex(230,0)
	Vb = Complex(-115,199.2)
	Vc = Complex(-115,-199.2)
	
	#-Input of unbalanced 3ph volt-#
	Vau = Complex(213.8,22.5)
	Vbu = Complex(-136.4,187.7)
	Vcu = Complex(-144.5,-160.5)
	
	#-Initialise-#
	V0 = 0
	V1 = 0
	V2 = 0
	Vnom = 230		# Queensland changed to 230 nominal LV
	
	puts Va,Vb,Vc	

	vM = Matrix[[Va],[Vb],[Vc]]
	vMu = Matrix[[Vau],[Vbu],[Vcu]]
		
	puts vM
				
	fort = Complex(-0.5,0.866)    	#1<120 = -0.5 + 0.866j, Fortescue
	fortCj = fort.conjugate	   		#1<240 = -0.5 - 0.866j, Fortescue Conjugate
	third = 1/3.to_f 				#use to_f to force into float
		
		
	
	puts third,fort,fortCj
		
	seqCoef = Matrix[[1,1,1],[1,fort,fortCj],[1,fortCj,fort]]
	thirdCoef = Matrix[[third,0,0],[0,third,0],[0,0,third]]
	
	puts seqCoef,thirdCoef
	
	#Vseq = Matrix[[0],[0],[0]]
	
	Vseq = thirdCoef * seqCoef * vM
	Vsequ = thirdCoef * seqCoef * vMu
	
	
	##now put into vecotr graph?
	
	puts Vseq,Vsequ
		
end
	
x = StdClass.new


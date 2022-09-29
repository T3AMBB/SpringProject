const	formform=document.getElementsByName("form1"),
		price=document.form1.price,
		amount=document.form1.amount,
		add=document.form1.add,
		jminus=document.form1.minus,
		sum=document.form1.sum;
		

if(formform)	{
	sum.value=price.value;
	
	let amountval=amount.value,
		priceval=price.value,
		sumval=sum.value;
		
		
	if(add) {
		add.addEventListener('click',function setInnerHTML(){
			amountval++;
			sumval=amountval*priceval;
			amount.value=amountval;
			sum.value=sumval;
			console.log(amountval,sumval,priceval);
				const element = document.getElementById('sumprice');
				element.innerHTML = 'sumval';

			
		});
	}
	
	if(minus) {
		minus.addEventListener('click',function setInnerHTML(){
			if(amountval > 1){
				amountval --;
				sumval=amountval*priceval;
				amount.value=amountval;
				sum.value=sumval;
				console.log(amountval,sumval,priceval);
					const element = document.getElementById('sumprice');
					element.innerHTML = 'sumval';
			}else{
				amountval=1;
			}
		});
	}
}
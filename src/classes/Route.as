package classes
{
	public class Route
	{
		private var adyacencias:Array;//nodes adjacencies with ech other 
		private var init:int;//initial node
		private var vdest:int;//end node
		private var cola:Vector.<Array>;//queue with pairs of adjacencies between nodes
		private var conocidos:Array;//nodes' status ("known" or "unknown") represented with 1's and 0's
		private var padres:Array;//relation about wich node id led by other (example: "padres[5]=15" means
		//that node 5 is reached through node 15 
		private var actual:int;//current node
		private var adyactual:Array;//stores the current node's adjacencies whith others
		private var temp:Array;//stores the last element extractet from the queue
		private var camino:Vector.<Array>;//stores the path wich leads from initial node to end node
		
		//Constructor(ourmap, initialnode, endnode)
		public function Route(adyacencias:Array,init:int,vdest:int) {
			this.init=init;
			this.adyacencias=adyacencias;
			this.vdest=vdest;
			cola=new Vector.<Array>(/*adyacencias.length,true*/);
			conocidos=new Array(adyacencias.length);
			padres=new Array(adyacencias.length);
			//conocidos[init]=1;
			cola.push(new Array(init,init));
			camino=new Vector.<Array>(/*adyacencias.length,true*/);
		}
		
		//Calculates the rigth path
		public function getRoute():Array{
			var rutas:Array=new Array();//lo que me da las rutas
			var sorttmp:String="0";
			for(var i:int=0;i<padres.length;i++){
				padres[i]=-1;
			}
			while(cola.length>0){
				temp=cola.shift();//este es el pop
				if(padres[temp[1]]==-1){
					padres[temp[1]]=temp[0];
					actual=temp[1];
					adyactual=adyacencias[actual];
					for( i=0;i<adyacencias.length;i++){
						if(adyactual[i]>0 && conocidos[i]!=0){
							cola.push(new Array(actual,i));
							conocidos[i]=1;
						}
					}
				}
				if(padres[vdest]!=-1){
					while(cola.length>0)
						cola.pop();
				}
			}
			//funcion presentar caminos
			//presents the path to user
			if(padres[vdest]!=-1){
				temp=new Array(vdest,padres[vdest]);
				camino.push(temp);
				var comp:Array=camino[camino.length-1];
				while(comp[1]!=init){
					temp=new Array(comp[1],padres[comp[1]]);
					camino.push(temp);
					comp=camino[camino.length-1];
				}
				for(i=(camino.length-1);i>-1;i--){
					temp=camino[i];
					trace(temp[1]+" - "+temp[0]);
					if(temp[1]>temp[0]){
						sorttmp=temp[0]+""+temp[1];
						rutas[i]=sorttmp;
					}else{
						//trace(temp[1]+""+temp[0]);
						rutas[i]=temp[1]+""+temp[0];}
				}
				/*for(var r=0;r<rutas.length;r++){
				trace(rutas[r]);
				}*/
			}else{
				//Notifies if there is not a path to the end node
				trace("No hubo resultados favorables...");}
			return rutas;
			
		}
	}
}
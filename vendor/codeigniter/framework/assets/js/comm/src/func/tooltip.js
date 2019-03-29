function showTooltip (tooltip, animation) {
	if(tooltip.style.display != 'initial') {
		tooltip.style.display='initial';
		tooltip.style.animation= animation + ' 2s ease-out 1';
		tooltip.style.WebkitAnimation= animation + ' 2s ease-out 1';

		setTimeout(function () {
			this.style.animation='';
			this.style.WebkitAnimation='';
			this.style.display='none';
		}.bind(tooltip), 2000);
	}
}

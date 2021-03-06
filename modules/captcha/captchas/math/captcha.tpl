<!-- math captcha.tpl -->
{config_load file=captcha_lang_conf}

<div class="control-group{if isset($register_captcha_error)} error{/if}">
	<label for="input01" class="control-label">CAPTCHA</label>
	<div class="controls">
		{if isset($register_captcha_error)}
			<div class="alert alert-error">
				<button class="close" data-dismiss="alert">&times;</button>
				{$register_captcha_error}
			</div>
		{/if}
		<div id="math_challenge">
			<div id="math_image">
				{$number1} + {$number2} = <input tabindex="10" class="span2" type="text" size="2" name="answer" />
			</div>
			<p class="help-inline math_details">
				{#Pligg_Captcha_Math_Help#}
			</p>
		</div>
	</div>
</div>

{config_load file=captcha_pligg_lang_conf}
<!--/ math captcha.tpl -->
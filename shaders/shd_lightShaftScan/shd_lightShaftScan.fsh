varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int stepNum;

void main()
{
	float sTester = 1.0;
	float eTester = 1.0;
	float startPoint1 = sTester+0.1;
	float startPoint2 = sTester+0.1;
	float endPoint1 = eTester+0.1;
	float endPoint2 = eTester+0.1;
	
	vec2 pixel = vec2(0,v_vTexcoord.x);
	for (float i = 0.0; i < float(stepNum); i+=1.0)
	{
		vec4 data = texture2D(gm_BaseTexture,pixel);
		float lum = data.r;
		if (startPoint1 >= sTester)
		{
			if (lum <= 0.25) startPoint1 = i/float(stepNum);
		}
		else if (endPoint1 >= eTester)
		{
			if (pixel.x+(1.0/float(stepNum)) >= 1.0) endPoint1 = 1.0;
			if (lum >= 0.75) endPoint1 = i/float(stepNum);
		}
		else if (startPoint2 >= sTester)
		{
			if (lum <= 0.25) startPoint2 = i/float(stepNum);
		}
		else if (endPoint2 >= eTester)
		{
			if (pixel.x+(1.0/float(stepNum)) >= 1.0) endPoint2 = 1.0;
			if (lum >= 0.75) endPoint2 = i/float(stepNum);
		}
		else
		{
			break;
		}
		pixel = vec2(pixel.x+(1.0/float(stepNum)),pixel.y);
	}
	
	gl_FragColor = vec4(startPoint1,endPoint1,startPoint2,endPoint2);
	//gl_FragColor = vec4(vec3(v_vTexcoord.x),1.0);
	//gl_FragColor = vec4(vec3(1.0/log(float(stepNum))),1.0);
	//gl_FragColor = vec4(vec3(minLum),1.0);
}

//// Old code
//void main()
//{
//	//glBindTexture(GLES20.GL_TEXTURE_2D, mTextureHandle);
//	//glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, filter);
	
//	float stepDist = sqrt(2.0)/float(stepNum);	
//	vec2 pixelToStartOn;
//	if (cornerStart.z >= 0.5)
//	{
//		pixelToStartOn = vec2(cornerStart.x,cornerStart.y+sign(sin(angle))*(2.0*v_vTexcoord.x));
//		pixelToStartOn = vec2(pixelToStartOn.x+sign(cos(angle))*abs(pixelToStartOn.y-clamp(pixelToStartOn.y,0.0,1.0)),clamp(pixelToStartOn.y,0.0,1.0));
//	}
//	else
//	{
//		pixelToStartOn = vec2(cornerStart.x-sign(cos(angle))*(2.0*v_vTexcoord.x),cornerStart.y);
//		pixelToStartOn.y += sign(sin(angle))*abs(pixelToStartOn.x-clamp(pixelToStartOn.x,0.0,1.0));
//	}
//	//pixelToStartOn = vec2(clamp(pixelToStartOn.x,0.0,1.0),clamp(pixelToStartOn.y,0.0,1.0));
//	vec2 pixelToCheck = pixelToStartOn;
//	float tester = 1.0;
//	float startPoint1 = tester;
//	float endPoint1 = tester;
//	float startPoint2 = tester;
//	float endPoint2 = tester;
//	for (int i = 0; i < stepNum; i++)
//    {
//		float red = texture2D(gm_BaseTexture,pixelToCheck).r;
//		if (startPoint1 == tester)
//		{
//			if (red <= 0.25) startPoint1 = float(i)/float(stepNum);
//		}
//		else if (endPoint1 == tester)
//		{
//			if (red >= 0.75) endPoint1 = float(i)/float(stepNum);
//		}
//		else if (startPoint2 == tester)
//		{
//			if (red <= 0.25) startPoint2 = float(i)/float(stepNum);
//		}
//		else if (endPoint2 == tester)
//		{
//			if (red >= 0.75) 
//			{
//				endPoint2 = float(i)/float(stepNum);
//				break;
//			}
//		}
//		pixelToCheck = vec2(pixelToCheck.x+cos(angle)*(stepDist),pixelToCheck.y-sin(angle)*(stepDist));
//		//if (pixelToCheck.x != clamp(pixelToCheck.x,0.0,1.0) || pixelToCheck.y != clamp(pixelToCheck.y,0.0,1.0))
//		//{
//		//	endPoint2 = float(i)/float(stepNum);
//		//	break;
//		//}
//	}
//	gl_FragColor = vec4(startPoint1,endPoint1,startPoint2,endPoint2);
//}

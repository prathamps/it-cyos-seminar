import 'package:cyos/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/NumberInputBox.dart';

import 'main.dart';

class club extends StatefulWidget {
  const club({super.key});

  @override
  State<club> createState() => _clubState();
}

class _clubState extends State<club> {
  int passCode = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 44, 44),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: Container(
                  child: SvgPicture.string(
            '''<svg width="246" height="233" viewBox="0 0 246 233" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="246" height="233" rx="116.5" fill="#FFF4F4"/>
<path d="M35.149 180.444H209.111V182.889H35.1481L35.149 180.444Z" fill="#5C5C5C"/>
<rect x="29.4444" y="57" width="185.582" height="123.456" rx="14" fill="#3A3A3A"/>
<rect x="29.4444" y="57" width="185.582" height="123.456" rx="14" fill="#212020"/>
<rect x="35.3331" y="62.8801" width="173.813" height="110.461" rx="21" fill="#3A3A3A"/>
<rect x="35.3331" y="62.8801" width="173.813" height="110.461" rx="21" fill="#565656"/>
<g filter="url(#filter0_d_0_1)">
<path d="M18.5517 187.439C17.4095 185.402 18.8816 182.889 21.2168 182.889H227.28C227.892 182.889 228.49 183.073 228.996 183.416V183.416C231.487 185.107 230.29 189 227.28 189H21.2168C20.1115 189 19.0923 188.403 18.5517 187.439V187.439Z" fill="#C4C4C4"/>
</g>
<defs>
<filter id="filter0_d_0_1" x="14.1568" y="182.889" width="220.185" height="14.1111" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="2"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_0_1"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_0_1" result="shape"/>
</filter>
</defs>
</svg>''',
            semanticsLabel: 'My SVG Image',
            alignment: AlignmentDirectional.center,
          ))),
          Container(
              margin: EdgeInsets.only(top: 24),
              child: SvgPicture.string(
                '''<svg width="214" height="47" viewBox="0 0 214 47" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 4.29789C0 2.00737 1.85684 0.150528 4.14737 0.150528V0.150528C6.43789 0.150528 8.29473 2.00737 8.29473 4.2979V42.3557C8.29473 44.6463 6.43789 46.5031 4.14737 46.5031V46.5031C1.85684 46.5031 0 44.6462 0 42.3557V4.29789Z" fill="#FFF4F4"/>
<path d="M150.488 6.67942C150.488 4.64442 152.138 2.99472 154.173 2.99472V2.99472C156.208 2.99472 157.857 4.64442 157.857 6.67942V38.2885C157.857 40.3235 156.208 41.9732 154.173 41.9732V41.9732C152.138 41.9732 150.488 40.3235 150.488 38.2885V6.67942Z" fill="#FFF4F4"/>
<path d="M170.808 6.67942C170.808 4.64442 172.458 2.99472 174.493 2.99472V2.99472C176.528 2.99472 178.178 4.64442 178.178 6.67942V38.2885C178.178 40.3235 176.528 41.9732 174.493 41.9732V41.9732C172.458 41.9732 170.808 40.3235 170.808 38.2885V6.67942Z" fill="#FFF4F4"/>
<path d="M178.178 38.0239C178.178 40.2144 176.758 42.3176 174.222 43.8822C171.686 45.4469 168.238 46.3482 164.615 46.3929C160.993 46.4375 157.487 45.6219 154.848 44.1211C152.209 42.6202 150.648 40.5537 150.5 38.365L157.807 35.1201H162.01H166.046H170.893L178.178 38.0239Z" fill="#FFF4F4"/>
<path d="M113.97 5.83166C113.97 3.67089 115.722 1.91924 117.883 1.91924V1.91924C120.044 1.91924 121.795 3.67089 121.795 5.83167V41.8814C121.795 44.0422 120.044 45.7938 117.883 45.7938V45.7938C115.722 45.7938 113.97 44.0422 113.97 41.8814V5.83166Z" fill="#FFF4F4"/>
<path d="M117.845 45.8863C115.788 45.8487 114.154 44.151 114.196 42.0944V42.0944C114.237 40.0377 115.938 38.4009 117.995 38.4384L142.102 38.8787C144.158 38.9163 145.792 40.614 145.751 42.6707V42.6707C145.709 44.7273 144.008 46.3641 141.951 46.3266L117.845 45.8863Z" fill="#FFF4F4"/>
<path d="M29.8119 3.23632C29.8119 1.44895 31.2608 0 33.0482 0V0C34.8356 0 36.2845 1.44895 36.2845 3.23632V43.1583C36.2845 44.9457 34.8356 46.3946 33.0482 46.3946V46.3946C31.2608 46.3946 29.8119 44.9457 29.8119 43.1583V3.23632Z" fill="#FFF4F4"/>
<path d="M18.2205 8.01028C16.0153 7.99678 14.2363 6.19815 14.247 3.99293V3.99293C14.2576 1.7877 16.054 0.0109593 18.2592 0.0244597L47.876 0.205776C50.0812 0.219276 51.8602 2.01791 51.8496 4.22313V4.22313C51.8389 6.42836 50.0426 8.2051 47.8373 8.1916L18.2205 8.01028Z" fill="#FFF4F4"/>
<path d="M104.26 46.227C101.385 46.205 98.5421 45.6124 95.8946 44.4829C93.2471 43.3535 90.8466 41.7093 88.8301 39.6444C86.8136 37.5794 85.2207 35.1341 84.1423 32.448C83.0638 29.7619 82.521 26.8876 82.5448 23.9894C82.5686 21.0911 83.1585 18.2255 84.2808 15.5563C85.4032 12.887 87.0361 10.4664 89.0862 8.43253C91.1363 6.39869 93.5635 4.79149 96.2292 3.7027C98.8949 2.61391 101.747 2.06484 104.622 2.08685L104.441 24.1569L104.26 46.227Z" fill="#FFF4F4"/>
<path d="M188.184 5.31073C188.184 3.24682 189.857 1.57368 191.921 1.57368V1.57368C193.985 1.57368 195.658 3.24682 195.658 5.31073V40.6322C195.658 42.6961 193.985 44.3693 191.921 44.3693V44.3693C189.857 44.3693 188.184 42.6961 188.184 40.6322V5.31073Z" fill="#FFF4F4"/>
<path d="M195.033 27.7521C197.436 27.7378 199.807 27.3234 201.99 26.5367C204.172 25.75 206.115 24.6092 207.688 23.1907C209.261 21.7722 210.427 20.1088 211.109 18.3119C211.792 16.5151 211.974 14.6263 211.643 12.7722C211.313 10.9181 210.478 9.14141 209.194 7.56129C207.91 5.98117 206.207 4.63409 204.199 3.61032C202.191 2.58655 199.924 1.90974 197.551 1.62524C195.177 1.34075 192.752 1.45514 190.438 1.96075L194.947 14.6126L195.033 27.7521Z" fill="#FFF4F4"/>
<path d="M209.501 20.5421C212.13 23.3256 213.651 27.0057 213.764 30.8594C213.877 34.7132 212.575 38.462 210.112 41.3694C207.65 44.2768 204.206 46.1326 200.457 46.5722C196.708 47.0119 192.924 46.0036 189.85 43.7454L192.606 39.8198C194.716 41.3699 197.313 42.062 199.887 41.7602C202.46 41.4584 204.824 40.1846 206.514 38.1889C208.205 36.1933 209.099 33.6201 209.021 30.9749C208.943 28.3296 207.899 25.8036 206.095 23.893L209.501 20.5421Z" fill="#FFF4F4"/>
</svg>
''',
                semanticsLabel: 'My SVG Image',
                alignment: AlignmentDirectional.center,
              )),
          Container(
            margin: EdgeInsets.only(top: 24),
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
                child: Center(
                    child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Passcode'),
              cursorColor: Colors.amber,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8), // allow up to 8 digits
              ],
              onChanged: (value) {
                setState(() {
                  passCode = int.parse(value);
                });
              },
            ))),
          ),
          Align(
            heightFactor: 1.5,
            alignment: Alignment.bottomRight,
            child: InkWell(
                onTap: () {
                  passCode == 5348
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return const Home();
                        }))
                      : Text("Hello");
                },
                child: SvgPicture.string(
                  '''<svg width="101" height="106" viewBox="0 0 101 106" fill="none" xmlns="http://www.w3.org/2000/svg">
<g filter="url(#filter0_d_28_110)">
<ellipse cx="42.0178" cy="43.2609" rx="42.0178" ry="43.2609" transform="matrix(0.965821 -0.259209 0.229266 0.973364 0 21.7828)" fill="#7A7979"/>
</g>
<g filter="url(#filter1_d_28_110)">
<ellipse cx="28.4031" cy="29.5865" rx="28.4031" ry="29.5865" transform="matrix(0.965821 -0.259209 0.229266 0.973364 15.6626 33.0173)" fill="#2D2C2C"/>
</g>
<path d="M49.7402 39.7354C53.3827 39.2066 56.9542 39.8958 59.9752 41.901C62.9962 43.9061 65.1616 46.9668 66.0703 50.5163C66.9789 54.0657 66.5693 57.8632 64.9172 61.2053C63.265 64.5474 60.4825 67.2076 57.0849 68.693C53.6873 70.1785 49.905 70.3885 46.4387 69.2842C42.9724 68.18 40.057 65.8362 38.2326 62.6871C36.4081 59.5381 35.7983 55.7972 36.5161 52.1574C37.2339 48.5177 39.2307 45.2258 42.1365 42.8915L43.7931 47.1154C41.7895 48.7249 41.627 50.4429 41.1321 52.9526C40.6371 55.4622 41.0576 58.0416 42.3156 60.2129C43.5736 62.3843 45.5838 64.0003 47.9738 64.7617C50.3639 65.5231 52.9719 65.3783 55.3145 64.3541C57.6572 63.3299 59.5758 61.4956 60.715 59.1912C61.8541 56.8868 62.1366 54.2683 61.5101 51.821C60.8835 49.3736 59.3905 47.2631 57.3074 45.8806C55.2244 44.498 54.0827 44.0184 51.5712 44.383L49.7402 39.7354Z" fill="#FFF4F4"/>
<rect width="5.72347" height="19.3016" rx="2.86173" transform="matrix(0.934486 -0.356 0.337841 0.941203 41.2658 36.5255)" fill="#FFF4F4"/>
<defs>
<filter id="filter0_d_28_110" x="4.71412" y="9.49512" width="91.5718" height="95.0098" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="2"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_28_110"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_28_110" result="shape"/>
</filter>
<filter id="filter1_d_28_110" x="17.6129" y="24.7216" width="64.5303" height="67.4635" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
<feFlood flood-opacity="0" result="BackgroundImageFix"/>
<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>
<feOffset dy="4"/>
<feGaussianBlur stdDeviation="2"/>
<feComposite in2="hardAlpha" operator="out"/>
<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>
<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_28_110"/>
<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_28_110" result="shape"/>
</filter>
</defs>
</svg>
''',
                  width: 120,
                  height: 120,
                )),
          ),
        ]));
  }
}

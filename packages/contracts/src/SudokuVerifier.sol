// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract SudokuVerifier {
    // Scalar field size
    uint256 constant r =
        21_888_242_871_839_275_222_246_405_745_257_275_088_548_364_400_416_034_343_698_204_186_575_808_495_617;
    // Base field size
    uint256 constant q =
        21_888_242_871_839_275_222_246_405_745_257_275_088_696_311_157_297_823_662_689_037_894_645_226_208_583;

    // Verification Key data
    uint256 constant alphax =
        20_491_192_805_390_485_299_153_009_773_594_534_940_189_261_866_228_447_918_068_658_471_970_481_763_042;
    uint256 constant alphay =
        9_383_485_363_053_290_200_918_347_156_157_836_566_562_967_994_039_712_273_449_902_621_266_178_545_958;
    uint256 constant betax1 =
        4_252_822_878_758_300_859_123_897_981_450_591_353_533_073_413_197_771_768_651_442_665_752_259_397_132;
    uint256 constant betax2 =
        6_375_614_351_688_725_206_403_948_262_868_962_793_625_744_043_794_305_715_222_011_528_459_656_738_731;
    uint256 constant betay1 =
        21_847_035_105_528_745_403_288_232_691_147_584_728_191_162_732_299_865_338_377_159_692_350_059_136_679;
    uint256 constant betay2 =
        10_505_242_626_370_262_277_552_901_082_094_356_697_409_835_680_220_590_971_873_171_140_371_331_206_856;
    uint256 constant gammax1 =
        11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634;
    uint256 constant gammax2 =
        10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781;
    uint256 constant gammay1 =
        4_082_367_875_863_433_681_332_203_403_145_435_568_316_851_327_593_401_208_105_741_076_214_120_093_531;
    uint256 constant gammay2 =
        8_495_653_923_123_431_417_604_973_247_489_272_438_418_190_587_263_600_148_770_280_649_306_958_101_930;
    uint256 constant deltax1 =
        11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634;
    uint256 constant deltax2 =
        10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781;
    uint256 constant deltay1 =
        4_082_367_875_863_433_681_332_203_403_145_435_568_316_851_327_593_401_208_105_741_076_214_120_093_531;
    uint256 constant deltay2 =
        8_495_653_923_123_431_417_604_973_247_489_272_438_418_190_587_263_600_148_770_280_649_306_958_101_930;

    uint256 constant IC0x =
        8_289_949_299_271_585_244_411_464_387_152_706_207_855_528_662_399_497_767_604_473_248_135_248_618_501;
    uint256 constant IC0y =
        602_028_220_687_630_964_399_601_756_732_824_157_515_691_527_454_261_366_150_903_802_976_420_170_833;

    uint256 constant IC1x =
        14_378_614_567_796_858_531_052_006_437_535_965_614_747_837_346_393_720_460_512_563_148_291_821_987_680;
    uint256 constant IC1y =
        15_555_244_453_962_110_638_848_111_886_193_360_887_199_688_654_681_164_787_526_299_320_694_262_129_098;

    uint256 constant IC2x =
        5_818_922_173_783_464_046_609_914_691_700_297_183_892_869_790_347_383_162_336_881_422_857_626_965_859;
    uint256 constant IC2y =
        16_733_498_363_225_660_252_327_029_519_880_970_951_571_562_997_162_023_232_022_534_229_783_200_944_238;

    uint256 constant IC3x =
        5_092_993_782_537_258_807_641_439_834_601_384_333_627_245_754_665_012_352_746_699_258_865_489_532_278;
    uint256 constant IC3y =
        6_302_597_501_050_031_411_235_112_864_226_972_903_773_938_518_149_854_239_673_766_462_986_427_025_444;

    uint256 constant IC4x =
        4_912_632_520_132_619_583_813_816_059_928_125_354_654_448_673_050_705_078_314_256_218_971_540_126_788;
    uint256 constant IC4y =
        11_170_705_717_488_484_606_670_707_756_873_148_907_411_091_666_521_545_041_257_981_292_553_708_577_566;

    uint256 constant IC5x =
        1_595_281_918_557_112_211_704_460_984_484_569_663_806_970_442_108_375_730_925_678_146_147_766_726_918;
    uint256 constant IC5y =
        4_002_128_832_513_127_191_510_037_546_391_710_655_871_577_304_461_341_019_521_507_937_779_207_505_917;

    uint256 constant IC6x =
        4_848_878_577_437_379_474_294_890_334_689_832_184_786_197_666_705_903_504_194_333_680_434_649_524_164;
    uint256 constant IC6y =
        17_656_290_862_807_488_577_688_892_178_029_519_564_873_817_612_782_446_410_171_899_189_234_418_739_783;

    uint256 constant IC7x =
        15_458_421_215_813_595_686_644_631_553_118_885_907_695_001_368_264_965_790_792_731_076_399_319_844_632;
    uint256 constant IC7y =
        18_175_482_125_305_858_920_189_493_969_494_979_706_909_982_663_410_096_036_861_630_371_982_741_169_954;

    uint256 constant IC8x =
        16_367_691_549_466_335_040_267_024_387_442_879_586_480_972_779_448_860_888_043_445_653_702_314_255_914;
    uint256 constant IC8y =
        16_964_201_102_111_217_998_081_756_184_709_321_180_201_909_045_120_686_123_033_023_610_144_146_198_147;

    uint256 constant IC9x =
        3_624_796_315_693_454_340_858_424_549_157_013_728_085_407_033_440_043_076_639_306_245_580_090_456_553;
    uint256 constant IC9y =
        1_976_992_820_594_523_356_909_003_405_919_050_363_801_175_539_238_311_110_789_026_921_801_806_400_573;

    uint256 constant IC10x =
        17_462_752_580_625_277_929_791_051_841_334_898_397_036_652_556_807_743_384_467_723_719_471_756_123_124;
    uint256 constant IC10y =
        16_819_997_995_738_403_106_739_940_618_566_093_505_702_557_494_067_025_022_199_538_185_598_311_641_889;

    uint256 constant IC11x =
        9_455_335_354_694_499_719_845_134_949_859_403_501_728_654_097_679_061_286_037_970_299_476_919_687_307;
    uint256 constant IC11y =
        11_433_801_080_083_265_649_202_449_339_925_741_550_582_342_053_554_550_445_021_045_871_728_610_836_418;

    uint256 constant IC12x =
        711_826_627_698_756_055_311_111_679_562_196_443_188_151_692_109_575_931_219_329_561_178_330_694_567;
    uint256 constant IC12y =
        18_314_649_810_316_995_488_648_964_980_733_612_463_358_535_136_926_551_238_917_599_406_285_844_382_015;

    uint256 constant IC13x =
        14_608_446_715_058_089_794_085_413_469_736_036_658_914_092_070_792_544_716_950_852_890_075_274_409_731;
    uint256 constant IC13y =
        2_695_090_167_984_400_054_478_654_804_756_237_615_629_139_035_154_177_928_494_046_123_382_271_249_511;

    uint256 constant IC14x =
        8_486_084_525_579_340_106_086_841_388_522_353_580_839_020_657_718_292_673_085_307_633_539_044_134_395;
    uint256 constant IC14y =
        6_393_293_363_501_266_802_181_709_411_693_905_416_943_772_932_733_253_886_332_274_801_069_272_857_029;

    uint256 constant IC15x =
        6_202_255_976_515_487_149_767_163_339_682_948_516_114_970_756_089_708_490_698_721_090_110_492_956_927;
    uint256 constant IC15y =
        11_442_965_624_243_855_528_311_888_691_934_320_347_785_169_385_055_651_312_322_980_373_665_696_393_489;

    uint256 constant IC16x =
        2_427_406_078_300_016_346_099_328_251_725_341_908_151_482_030_149_106_958_359_255_522_591_825_266_495;
    uint256 constant IC16y =
        6_265_007_926_905_790_788_637_060_806_705_608_471_212_554_860_237_688_560_613_474_911_422_651_815_107;

    uint256 constant IC17x =
        19_933_171_165_980_578_267_191_174_519_968_941_299_991_889_312_267_300_131_836_215_856_994_898_539_018;
    uint256 constant IC17y =
        20_168_475_689_498_721_001_020_662_355_446_426_060_329_614_971_207_065_705_125_179_356_502_167_710_560;

    uint256 constant IC18x =
        12_689_259_411_571_922_700_677_035_916_285_013_035_656_177_480_817_156_961_917_650_557_323_344_394_345;
    uint256 constant IC18y =
        5_277_825_330_739_072_678_940_889_338_712_059_795_210_076_282_120_185_727_429_469_686_265_493_502_103;

    uint256 constant IC19x =
        9_572_181_380_316_732_701_213_756_245_635_389_965_201_349_057_622_438_896_085_662_205_445_374_899_183;
    uint256 constant IC19y =
        15_583_315_569_515_477_306_022_406_889_191_258_635_434_676_581_474_542_717_916_819_190_864_539_062_086;

    uint256 constant IC20x =
        2_847_370_930_569_562_703_234_972_432_331_706_852_935_414_642_888_275_464_108_667_473_417_416_726_831;
    uint256 constant IC20y =
        10_192_328_433_568_336_163_320_751_531_103_050_503_468_245_059_547_972_583_399_278_815_624_387_305_693;

    uint256 constant IC21x =
        3_148_001_468_606_845_930_653_475_266_638_748_627_250_562_000_290_912_510_211_412_705_261_566_601_429;
    uint256 constant IC21y =
        12_686_526_959_694_806_548_705_987_688_908_354_287_889_083_338_681_273_821_264_937_932_619_954_056_763;

    uint256 constant IC22x =
        15_280_576_648_223_251_274_763_364_258_420_219_835_509_658_816_023_079_647_749_768_436_556_238_621_747;
    uint256 constant IC22y =
        4_815_190_493_976_512_290_558_059_460_845_248_554_192_947_779_234_674_915_749_071_490_141_330_696_482;

    uint256 constant IC23x =
        2_465_295_209_117_577_185_256_476_161_031_150_889_678_348_434_228_998_301_944_831_595_200_267_625_788;
    uint256 constant IC23y =
        20_120_231_664_591_368_310_696_951_650_461_388_658_222_378_907_697_923_067_234_400_693_415_128_277_536;

    uint256 constant IC24x =
        14_926_958_798_797_811_891_313_047_859_244_214_838_984_758_020_067_646_870_774_390_125_930_012_289_483;
    uint256 constant IC24y =
        7_499_490_475_698_520_742_358_190_617_911_497_604_399_108_474_351_630_797_167_563_470_294_041_713_243;

    uint256 constant IC25x =
        5_651_877_378_830_823_490_627_523_597_944_668_997_982_686_830_770_791_191_445_990_804_589_882_582_113;
    uint256 constant IC25y =
        20_156_092_256_424_617_643_718_039_573_665_670_734_375_679_269_028_865_644_833_703_936_500_255_606_726;

    uint256 constant IC26x =
        7_504_272_470_569_355_899_868_755_870_328_617_652_241_072_213_119_181_304_548_402_945_498_570_793_373;
    uint256 constant IC26y =
        8_846_469_774_373_572_483_583_795_053_024_154_332_894_980_295_714_261_652_440_255_439_028_539_531_199;

    uint256 constant IC27x =
        7_745_048_837_389_693_113_391_012_407_389_872_983_446_752_414_230_852_265_947_916_122_410_104_689_796;
    uint256 constant IC27y =
        2_070_490_294_080_312_503_345_152_977_264_188_593_663_505_453_301_703_963_981_438_225_029_135_972_527;

    uint256 constant IC28x =
        20_099_023_108_371_251_044_091_221_805_274_920_630_779_706_150_242_970_663_140_214_657_564_551_904_454;
    uint256 constant IC28y =
        17_139_272_770_902_863_131_118_168_609_572_847_350_474_393_431_405_219_174_594_382_882_785_430_177_991;

    uint256 constant IC29x =
        1_617_324_759_645_918_831_739_379_720_458_663_499_051_939_261_305_008_335_559_434_794_383_369_316_548;
    uint256 constant IC29y =
        4_605_675_175_146_542_492_889_736_967_530_266_081_353_823_877_324_265_448_257_028_071_244_204_406;

    uint256 constant IC30x =
        11_254_693_718_672_614_707_273_259_291_499_224_653_803_930_306_190_876_730_661_415_279_095_250_333_381;
    uint256 constant IC30y =
        12_997_277_227_907_748_605_385_687_012_462_781_845_302_074_152_408_687_300_767_530_601_772_431_527_185;

    uint256 constant IC31x =
        12_759_837_877_965_584_982_150_839_033_126_687_246_788_298_116_170_070_303_217_409_759_549_358_540_668;
    uint256 constant IC31y =
        3_229_159_766_114_859_368_462_547_836_534_815_209_726_685_360_683_152_459_382_868_759_310_053_908_643;

    uint256 constant IC32x =
        17_601_099_947_681_249_733_100_541_879_949_676_517_534_774_783_229_201_706_713_729_104_290_942_219_609;
    uint256 constant IC32y =
        17_586_314_489_822_200_114_649_977_200_647_626_628_785_820_437_023_085_187_047_752_307_991_516_381_875;

    uint256 constant IC33x =
        3_173_808_842_118_723_795_457_418_927_018_103_399_025_554_791_377_652_540_819_112_103_959_048_160_243;
    uint256 constant IC33y =
        6_263_692_657_087_894_488_172_519_024_967_769_133_961_061_579_602_483_447_526_771_231_867_588_448_409;

    uint256 constant IC34x =
        14_780_580_578_852_031_295_033_129_203_578_440_340_060_013_857_681_729_906_877_751_843_744_568_193_955;
    uint256 constant IC34y =
        7_960_447_707_707_366_011_985_619_839_703_261_998_516_075_554_265_661_960_452_345_826_043_779_804_995;

    uint256 constant IC35x =
        10_365_742_036_653_366_417_900_680_557_726_332_048_888_260_158_303_975_951_769_167_209_046_582_841_551;
    uint256 constant IC35y =
        16_456_768_020_293_053_726_376_654_363_110_050_823_855_737_375_426_068_875_727_632_682_503_546_806_876;

    uint256 constant IC36x =
        14_177_320_480_300_608_460_294_641_515_436_067_381_983_953_368_356_445_509_012_139_367_828_565_767_941;
    uint256 constant IC36y =
        5_431_004_102_709_619_161_359_698_922_523_286_862_058_554_813_409_364_085_671_337_768_182_736_281_939;

    uint256 constant IC37x =
        293_230_444_967_840_614_758_801_127_964_754_180_733_959_229_727_216_797_122_730_917_431_359_089_589;
    uint256 constant IC37y =
        14_875_590_396_326_952_645_460_931_639_321_907_919_274_963_694_110_345_592_961_084_343_819_183_764_184;

    uint256 constant IC38x =
        18_797_544_178_158_770_217_059_729_669_189_426_909_978_000_361_224_522_200_793_334_540_674_917_371_567;
    uint256 constant IC38y =
        20_290_877_121_459_519_702_820_410_360_738_219_352_282_672_672_374_682_507_632_565_317_959_068_205_537;

    uint256 constant IC39x =
        19_958_296_981_701_316_500_551_766_209_271_460_026_883_105_709_410_468_589_166_404_883_137_323_184_604;
    uint256 constant IC39y =
        12_411_592_536_332_194_574_694_527_847_089_538_174_950_924_660_173_703_277_730_359_062_249_619_955_440;

    uint256 constant IC40x =
        13_702_874_537_615_381_283_113_449_753_131_332_745_396_958_885_525_462_068_226_713_415_221_846_902_504;
    uint256 constant IC40y =
        466_370_650_705_419_845_197_319_871_541_863_560_025_286_121_677_183_669_802_933_529_573_193_977_261;

    uint256 constant IC41x =
        1_564_722_864_213_472_680_772_898_311_763_496_009_558_833_281_684_845_399_054_028_307_501_794_337_286;
    uint256 constant IC41y =
        20_241_710_348_592_242_445_200_283_866_671_461_769_301_589_136_698_889_212_494_880_082_097_108_539_801;

    uint256 constant IC42x =
        15_982_456_674_004_828_717_503_956_076_306_947_057_721_908_151_371_527_963_951_232_132_385_031_872_062;
    uint256 constant IC42y =
        17_613_818_844_756_238_390_196_838_244_042_616_255_770_539_035_507_001_754_056_999_389_039_571_626_841;

    uint256 constant IC43x =
        21_154_988_015_533_700_698_675_720_732_333_943_098_482_824_414_601_058_289_263_181_415_678_284_495_992;
    uint256 constant IC43y =
        10_766_313_902_445_190_505_121_132_727_247_301_769_415_271_192_688_035_556_652_935_692_675_690_145_385;

    uint256 constant IC44x =
        20_949_636_158_745_155_667_777_739_817_736_113_880_056_425_836_755_865_081_591_721_463_582_501_686_393;
    uint256 constant IC44y =
        3_517_750_746_802_880_168_063_423_739_329_892_364_089_502_864_038_479_399_503_374_331_945_072_025_181;

    uint256 constant IC45x =
        16_557_957_881_893_562_520_771_397_953_038_067_039_329_409_661_728_724_076_504_826_783_253_667_009_935;
    uint256 constant IC45y =
        3_493_457_307_920_328_230_834_134_382_953_710_662_116_289_888_380_744_688_650_403_718_185_028_951_054;

    uint256 constant IC46x =
        12_556_176_207_794_754_796_821_244_214_452_181_104_455_244_839_246_376_329_511_829_508_923_611_065_480;
    uint256 constant IC46y =
        447_949_295_467_628_042_668_399_028_550_812_979_677_407_305_895_244_103_266_757_812_138_145_370_614;

    uint256 constant IC47x =
        8_358_270_255_272_926_833_865_119_696_678_885_418_069_729_347_548_951_218_154_858_098_536_224_018_586;
    uint256 constant IC47y =
        4_740_889_545_402_143_211_940_199_025_090_609_186_228_064_185_298_579_298_606_994_108_445_843_952_341;

    uint256 constant IC48x =
        5_661_867_920_706_466_694_045_495_365_863_083_535_069_105_832_260_025_514_628_509_763_613_650_455_129;
    uint256 constant IC48y =
        631_278_856_580_370_108_159_533_506_912_607_278_402_808_979_356_091_896_671_743_635_451_515_381_272;

    uint256 constant IC49x =
        958_534_180_547_026_515_252_870_767_579_970_700_576_016_759_464_081_791_075_393_420_254_385_766_962;
    uint256 constant IC49y =
        21_598_483_303_556_483_555_587_470_445_152_221_278_689_809_423_938_538_591_034_593_092_855_545_113_630;

    uint256 constant IC50x =
        9_059_118_511_341_741_927_452_873_156_535_905_481_277_004_674_790_531_969_589_878_848_965_634_995_721;
    uint256 constant IC50y =
        7_759_076_015_762_461_843_955_064_400_708_628_689_665_128_176_518_433_370_692_126_258_316_781_044_589;

    uint256 constant IC51x =
        18_000_189_169_591_715_341_879_655_441_866_730_617_951_284_169_166_435_407_534_930_596_317_439_230_571;
    uint256 constant IC51y =
        9_237_692_551_734_095_731_335_721_811_509_563_215_371_073_110_856_358_717_074_715_195_706_992_731_536;

    uint256 constant IC52x =
        13_875_495_990_227_505_228_446_859_913_301_000_050_997_840_352_882_736_374_309_618_075_415_310_894_648;
    uint256 constant IC52y =
        3_497_276_303_949_216_285_159_458_753_087_914_672_946_164_176_419_127_627_578_799_181_015_095_956_873;

    uint256 constant IC53x =
        18_447_324_748_162_254_557_490_058_359_493_475_348_866_958_049_718_715_121_269_546_281_859_097_875_236;
    uint256 constant IC53y =
        17_077_342_491_879_725_483_408_384_985_562_872_427_778_043_781_188_668_948_568_754_633_334_966_147_582;

    uint256 constant IC54x =
        12_851_056_729_071_923_779_895_951_169_999_899_723_192_332_071_242_327_892_104_940_178_549_135_250_767;
    uint256 constant IC54y =
        18_634_098_455_836_127_811_166_537_054_006_769_004_625_567_161_896_081_603_107_849_451_917_841_610_029;

    uint256 constant IC55x =
        17_403_056_415_026_394_500_298_873_560_117_615_010_477_265_904_720_715_456_810_417_508_186_205_303_034;
    uint256 constant IC55y =
        8_964_264_574_319_211_246_675_268_341_429_720_450_511_948_605_205_744_556_261_372_597_555_758_671_802;

    uint256 constant IC56x =
        18_076_699_560_142_031_249_365_246_487_867_216_573_467_696_461_365_894_405_244_494_672_668_265_559_911;
    uint256 constant IC56y =
        3_846_332_807_924_276_770_069_687_030_211_249_511_052_092_299_439_390_683_646_280_741_932_556_175_212;

    uint256 constant IC57x =
        77_519_037_424_879_463_498_594_143_523_086_832_364_892_778_842_456_437_054_079_427_865_698_674_768;
    uint256 constant IC57y =
        6_234_020_029_278_098_010_442_369_543_106_746_611_262_917_860_119_526_547_845_899_987_070_452_927_155;

    uint256 constant IC58x =
        19_650_352_048_870_088_123_355_117_953_243_496_107_099_075_237_274_114_851_765_312_863_420_178_229_097;
    uint256 constant IC58y =
        10_950_108_713_102_878_453_907_148_978_492_208_067_110_447_584_738_718_802_082_216_276_647_381_125_337;

    uint256 constant IC59x =
        4_089_846_277_309_905_920_586_812_937_579_634_932_927_041_973_309_126_976_909_424_779_539_590_437_521;
    uint256 constant IC59y =
        16_472_710_219_322_117_499_520_866_547_339_568_760_128_277_711_833_416_003_185_110_132_525_826_992_206;

    uint256 constant IC60x =
        3_562_400_560_182_011_603_204_073_482_249_013_763_255_845_752_734_021_837_260_387_420_734_067_465_802;
    uint256 constant IC60y =
        566_201_039_058_796_287_201_629_017_713_992_492_518_344_077_384_066_931_553_594_729_805_860_806_751;

    uint256 constant IC61x =
        7_871_742_474_534_361_706_329_311_011_956_372_267_757_125_908_421_038_101_063_080_056_794_069_777_086;
    uint256 constant IC61y =
        3_388_386_647_449_561_775_701_169_844_845_217_317_795_433_096_109_859_259_799_076_496_377_267_701_513;

    uint256 constant IC62x =
        7_173_871_911_007_249_670_749_514_428_358_873_088_359_375_797_528_368_312_946_388_329_573_810_755_094;
    uint256 constant IC62y =
        11_453_598_252_068_068_210_646_741_408_968_788_245_969_259_663_830_102_964_256_690_295_858_306_894_797;

    uint256 constant IC63x =
        8_030_036_706_905_250_057_707_130_166_764_568_759_869_289_421_792_861_235_643_223_918_662_069_112_599;
    uint256 constant IC63y =
        21_710_263_275_910_884_203_412_915_512_304_751_240_888_507_453_381_604_058_564_846_537_925_964_739_440;

    uint256 constant IC64x =
        10_252_108_491_481_663_646_364_239_559_488_669_473_340_990_765_161_097_080_381_759_825_411_878_346_340;
    uint256 constant IC64y =
        2_318_411_219_443_031_223_556_078_150_091_452_975_621_960_559_518_557_995_101_011_583_264_341_339_419;

    uint256 constant IC65x =
        8_382_798_759_916_358_141_275_601_700_827_962_870_337_446_114_207_503_865_940_817_036_384_939_891_543;
    uint256 constant IC65y =
        20_195_646_290_580_584_227_072_537_779_857_780_996_174_230_198_622_241_354_752_629_301_319_019_319_830;

    uint256 constant IC66x =
        3_409_860_861_889_595_512_046_375_962_758_554_547_177_114_993_541_625_056_380_996_674_981_022_078_925;
    uint256 constant IC66y =
        6_533_268_803_614_419_258_954_947_653_080_079_844_123_930_052_516_011_388_860_224_235_942_385_065_464;

    uint256 constant IC67x =
        19_900_371_125_318_484_880_578_259_019_112_913_626_825_499_003_482_769_033_002_090_154_409_007_806_470;
    uint256 constant IC67y =
        7_111_207_192_414_851_491_611_143_534_233_933_059_865_974_877_235_228_351_894_012_799_734_359_793_110;

    uint256 constant IC68x =
        21_271_397_541_842_631_528_252_310_593_419_300_180_653_119_200_089_107_586_442_372_529_135_730_988_003;
    uint256 constant IC68y =
        2_688_555_989_209_285_931_424_196_363_584_054_455_300_368_074_708_220_057_620_903_764_463_581_401_464;

    uint256 constant IC69x =
        5_886_576_876_121_043_358_717_636_332_812_212_860_233_972_861_939_640_917_947_913_866_135_502_264_290;
    uint256 constant IC69y =
        6_326_147_844_104_426_259_880_758_446_195_334_756_846_013_861_213_437_378_207_265_716_524_892_168_506;

    uint256 constant IC70x =
        13_128_902_859_394_729_149_824_157_303_937_334_996_069_428_505_107_018_276_444_662_824_334_639_894_947;
    uint256 constant IC70y =
        18_444_329_305_895_870_335_316_246_955_960_144_394_462_296_257_927_984_180_751_266_981_446_675_630_485;

    uint256 constant IC71x =
        11_274_098_429_209_630_128_294_417_483_088_302_440_848_007_996_023_671_818_547_799_560_579_043_690_500;
    uint256 constant IC71y =
        13_626_252_394_859_635_987_457_241_891_372_394_163_218_817_631_713_354_084_317_688_164_302_306_233_628;

    uint256 constant IC72x =
        21_149_014_631_849_729_207_256_892_706_304_922_131_628_355_199_958_190_403_080_613_186_569_192_403_715;
    uint256 constant IC72y =
        21_709_577_982_336_190_825_597_091_912_253_255_051_913_118_938_407_546_975_241_076_017_533_144_776_950;

    uint256 constant IC73x =
        7_002_655_808_624_107_464_778_523_378_781_303_205_943_576_613_705_391_082_336_233_163_141_366_941_625;
    uint256 constant IC73y =
        6_066_259_973_159_651_648_923_232_247_842_286_945_028_211_585_707_448_509_680_516_714_551_636_520_523;

    uint256 constant IC74x =
        12_068_520_550_543_033_674_252_359_113_638_590_577_017_139_722_512_125_328_499_423_662_755_506_689_393;
    uint256 constant IC74y =
        14_393_494_617_908_122_906_623_281_386_837_266_592_601_968_918_709_674_782_379_677_407_270_057_080_741;

    uint256 constant IC75x =
        4_266_451_363_767_364_819_833_569_662_913_332_949_276_293_908_907_951_959_008_051_168_195_499_528_708;
    uint256 constant IC75y =
        3_096_758_584_798_287_081_616_863_539_326_112_678_635_565_487_427_292_668_334_827_991_840_338_944_149;

    uint256 constant IC76x =
        21_101_581_578_823_257_706_513_744_407_948_708_459_007_606_485_197_437_262_949_088_670_685_559_188_513;
    uint256 constant IC76y =
        5_324_283_950_791_690_771_607_509_093_987_776_613_882_092_884_856_347_345_472_152_848_544_886_030_004;

    uint256 constant IC77x =
        18_843_153_333_286_691_505_644_566_178_010_396_886_618_592_077_079_890_128_575_065_017_465_629_466_420;
    uint256 constant IC77y =
        4_674_543_773_702_741_769_046_933_785_598_608_160_155_729_438_797_894_294_314_682_517_785_467_134_355;

    uint256 constant IC78x =
        12_096_683_708_924_994_572_228_328_162_555_146_811_088_851_226_831_030_783_533_896_171_306_298_725_418;
    uint256 constant IC78y =
        20_793_324_826_206_902_282_780_329_555_921_182_292_797_070_505_644_766_978_149_081_356_376_061_497_924;

    uint256 constant IC79x =
        7_544_557_328_007_047_733_582_127_225_601_307_022_359_787_484_893_666_085_302_448_606_181_632_124_212;
    uint256 constant IC79y =
        11_756_013_476_233_046_033_037_765_003_192_626_267_548_085_693_888_580_890_701_021_937_685_244_068_698;

    uint256 constant IC80x =
        18_097_734_944_168_659_063_456_376_453_496_520_468_315_447_634_785_332_503_315_087_648_788_909_672_612;
    uint256 constant IC80y =
        1_856_440_567_390_246_762_480_021_154_490_641_867_711_083_663_933_065_171_343_466_778_316_296_080_451;

    uint256 constant IC81x =
        9_623_096_166_063_491_489_103_363_826_845_355_271_985_303_939_647_220_842_793_290_763_427_957_658_175;
    uint256 constant IC81y =
        19_193_198_634_930_537_658_034_729_213_867_468_798_270_912_267_021_581_331_906_466_973_246_556_672_464;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[81] calldata _pubSignals
    )
        public
        view
        returns (bool)
    {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))

                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))

                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))

                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))

                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))

                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))

                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))

                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))

                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))

                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))

                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))

                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))

                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))

                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))

                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))

                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))

                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))

                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))

                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))

                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))

                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))

                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))

                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))

                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))

                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))

                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))

                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))

                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))

                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))

                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))

                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))

                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))

                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))

                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))

                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))

                g1_mulAccC(_pVk, IC47x, IC47y, calldataload(add(pubSignals, 1472)))

                g1_mulAccC(_pVk, IC48x, IC48y, calldataload(add(pubSignals, 1504)))

                g1_mulAccC(_pVk, IC49x, IC49y, calldataload(add(pubSignals, 1536)))

                g1_mulAccC(_pVk, IC50x, IC50y, calldataload(add(pubSignals, 1568)))

                g1_mulAccC(_pVk, IC51x, IC51y, calldataload(add(pubSignals, 1600)))

                g1_mulAccC(_pVk, IC52x, IC52y, calldataload(add(pubSignals, 1632)))

                g1_mulAccC(_pVk, IC53x, IC53y, calldataload(add(pubSignals, 1664)))

                g1_mulAccC(_pVk, IC54x, IC54y, calldataload(add(pubSignals, 1696)))

                g1_mulAccC(_pVk, IC55x, IC55y, calldataload(add(pubSignals, 1728)))

                g1_mulAccC(_pVk, IC56x, IC56y, calldataload(add(pubSignals, 1760)))

                g1_mulAccC(_pVk, IC57x, IC57y, calldataload(add(pubSignals, 1792)))

                g1_mulAccC(_pVk, IC58x, IC58y, calldataload(add(pubSignals, 1824)))

                g1_mulAccC(_pVk, IC59x, IC59y, calldataload(add(pubSignals, 1856)))

                g1_mulAccC(_pVk, IC60x, IC60y, calldataload(add(pubSignals, 1888)))

                g1_mulAccC(_pVk, IC61x, IC61y, calldataload(add(pubSignals, 1920)))

                g1_mulAccC(_pVk, IC62x, IC62y, calldataload(add(pubSignals, 1952)))

                g1_mulAccC(_pVk, IC63x, IC63y, calldataload(add(pubSignals, 1984)))

                g1_mulAccC(_pVk, IC64x, IC64y, calldataload(add(pubSignals, 2016)))

                g1_mulAccC(_pVk, IC65x, IC65y, calldataload(add(pubSignals, 2048)))

                g1_mulAccC(_pVk, IC66x, IC66y, calldataload(add(pubSignals, 2080)))

                g1_mulAccC(_pVk, IC67x, IC67y, calldataload(add(pubSignals, 2112)))

                g1_mulAccC(_pVk, IC68x, IC68y, calldataload(add(pubSignals, 2144)))

                g1_mulAccC(_pVk, IC69x, IC69y, calldataload(add(pubSignals, 2176)))

                g1_mulAccC(_pVk, IC70x, IC70y, calldataload(add(pubSignals, 2208)))

                g1_mulAccC(_pVk, IC71x, IC71y, calldataload(add(pubSignals, 2240)))

                g1_mulAccC(_pVk, IC72x, IC72y, calldataload(add(pubSignals, 2272)))

                g1_mulAccC(_pVk, IC73x, IC73y, calldataload(add(pubSignals, 2304)))

                g1_mulAccC(_pVk, IC74x, IC74y, calldataload(add(pubSignals, 2336)))

                g1_mulAccC(_pVk, IC75x, IC75y, calldataload(add(pubSignals, 2368)))

                g1_mulAccC(_pVk, IC76x, IC76y, calldataload(add(pubSignals, 2400)))

                g1_mulAccC(_pVk, IC77x, IC77y, calldataload(add(pubSignals, 2432)))

                g1_mulAccC(_pVk, IC78x, IC78y, calldataload(add(pubSignals, 2464)))

                g1_mulAccC(_pVk, IC79x, IC79y, calldataload(add(pubSignals, 2496)))

                g1_mulAccC(_pVk, IC80x, IC80y, calldataload(add(pubSignals, 2528)))

                g1_mulAccC(_pVk, IC81x, IC81y, calldataload(add(pubSignals, 2560)))

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))

                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)

                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            checkField(calldataload(add(_pubSignals, 384)))

            checkField(calldataload(add(_pubSignals, 416)))

            checkField(calldataload(add(_pubSignals, 448)))

            checkField(calldataload(add(_pubSignals, 480)))

            checkField(calldataload(add(_pubSignals, 512)))

            checkField(calldataload(add(_pubSignals, 544)))

            checkField(calldataload(add(_pubSignals, 576)))

            checkField(calldataload(add(_pubSignals, 608)))

            checkField(calldataload(add(_pubSignals, 640)))

            checkField(calldataload(add(_pubSignals, 672)))

            checkField(calldataload(add(_pubSignals, 704)))

            checkField(calldataload(add(_pubSignals, 736)))

            checkField(calldataload(add(_pubSignals, 768)))

            checkField(calldataload(add(_pubSignals, 800)))

            checkField(calldataload(add(_pubSignals, 832)))

            checkField(calldataload(add(_pubSignals, 864)))

            checkField(calldataload(add(_pubSignals, 896)))

            checkField(calldataload(add(_pubSignals, 928)))

            checkField(calldataload(add(_pubSignals, 960)))

            checkField(calldataload(add(_pubSignals, 992)))

            checkField(calldataload(add(_pubSignals, 1024)))

            checkField(calldataload(add(_pubSignals, 1056)))

            checkField(calldataload(add(_pubSignals, 1088)))

            checkField(calldataload(add(_pubSignals, 1120)))

            checkField(calldataload(add(_pubSignals, 1152)))

            checkField(calldataload(add(_pubSignals, 1184)))

            checkField(calldataload(add(_pubSignals, 1216)))

            checkField(calldataload(add(_pubSignals, 1248)))

            checkField(calldataload(add(_pubSignals, 1280)))

            checkField(calldataload(add(_pubSignals, 1312)))

            checkField(calldataload(add(_pubSignals, 1344)))

            checkField(calldataload(add(_pubSignals, 1376)))

            checkField(calldataload(add(_pubSignals, 1408)))

            checkField(calldataload(add(_pubSignals, 1440)))

            checkField(calldataload(add(_pubSignals, 1472)))

            checkField(calldataload(add(_pubSignals, 1504)))

            checkField(calldataload(add(_pubSignals, 1536)))

            checkField(calldataload(add(_pubSignals, 1568)))

            checkField(calldataload(add(_pubSignals, 1600)))

            checkField(calldataload(add(_pubSignals, 1632)))

            checkField(calldataload(add(_pubSignals, 1664)))

            checkField(calldataload(add(_pubSignals, 1696)))

            checkField(calldataload(add(_pubSignals, 1728)))

            checkField(calldataload(add(_pubSignals, 1760)))

            checkField(calldataload(add(_pubSignals, 1792)))

            checkField(calldataload(add(_pubSignals, 1824)))

            checkField(calldataload(add(_pubSignals, 1856)))

            checkField(calldataload(add(_pubSignals, 1888)))

            checkField(calldataload(add(_pubSignals, 1920)))

            checkField(calldataload(add(_pubSignals, 1952)))

            checkField(calldataload(add(_pubSignals, 1984)))

            checkField(calldataload(add(_pubSignals, 2016)))

            checkField(calldataload(add(_pubSignals, 2048)))

            checkField(calldataload(add(_pubSignals, 2080)))

            checkField(calldataload(add(_pubSignals, 2112)))

            checkField(calldataload(add(_pubSignals, 2144)))

            checkField(calldataload(add(_pubSignals, 2176)))

            checkField(calldataload(add(_pubSignals, 2208)))

            checkField(calldataload(add(_pubSignals, 2240)))

            checkField(calldataload(add(_pubSignals, 2272)))

            checkField(calldataload(add(_pubSignals, 2304)))

            checkField(calldataload(add(_pubSignals, 2336)))

            checkField(calldataload(add(_pubSignals, 2368)))

            checkField(calldataload(add(_pubSignals, 2400)))

            checkField(calldataload(add(_pubSignals, 2432)))

            checkField(calldataload(add(_pubSignals, 2464)))

            checkField(calldataload(add(_pubSignals, 2496)))

            checkField(calldataload(add(_pubSignals, 2528)))

            checkField(calldataload(add(_pubSignals, 2560)))

            checkField(calldataload(add(_pubSignals, 2592)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}

use GD;
use MIME::Base64 qw|encode_base64|;
use Time::HiRes qw|usleep|;
use Tk;
use Tk::Button;
use Tk::Frame;
use Tk::JBrowseEntry;
use Tk::Label;
use Tk::MainWindow;
use Tk::Photo;
use Tk::PNG;

my %listBatteryHash = (
						'0 + 0 =' => '0',
						'0 + 1 =' => '1',
						'0 + 2 =' => '2',
						'0 + 3 =' => '3',
						'0 + 4 =' => '4',
						'0 + 5 =' => '5',
						'0 + 6 =' => '6',
						'0 + 7 =' => '7',
						'0 + 8 =' => '8',
						'0 + 9 =' => '9',
						'1 + 0 =' => '1',
						'1 + 1 =' => '2',
						'1 + 2 =' => '3',
						'1 + 3 =' => '4',
						'1 + 4 =' => '5',
						'1 + 5 =' => '6',
						'1 + 6 =' => '7',
						'1 + 7 =' => '8',
						'1 + 8 =' => '9',
						'1 + 9 =' => '10',
						'2 + 0 =' => '2',
						'2 + 1 =' => '3',
						'2 + 2 =' => '4',
						'2 + 3 =' => '5',
						'2 + 4 =' => '6',
						'2 + 5 =' => '7',
						'2 + 6 =' => '8',
						'2 + 7 =' => '9',
						'2 + 8 =' => '10',
						'2 + 9 =' => '11',
						'3 + 0 =' => '3',
						'3 + 1 =' => '4',
						'3 + 2 =' => '5',
						'3 + 3 =' => '6',
						'3 + 4 =' => '7',
						'3 + 5 =' => '8',
						'3 + 6 =' => '9',
						'3 + 7 =' => '10',
						'3 + 8 =' => '11',
						'3 + 9 =' => '12',
						'4 + 0 =' => '4',
						'4 + 1 =' => '5',
						'4 + 2 =' => '6',
						'4 + 3 =' => '7',
						'4 + 4 =' => '8',
						'4 + 5 =' => '9',
						'4 + 6 =' => '10',
						'4 + 7 =' => '11',
						'4 + 8 =' => '12',
						'4 + 9 =' => '13',
						'5 + 0 =' => '5',
						'5 + 1 =' => '6',
						'5 + 2 =' => '7',
						'5 + 3 =' => '8',
						'5 + 4 =' => '9',
						'5 + 5 =' => '10',
						'5 + 6 =' => '11',
						'5 + 7 =' => '12',
						'5 + 8 =' => '13',
						'5 + 9 =' => '14',
						'6 + 0 =' => '6',
						'6 + 1 =' => '7',
						'6 + 2 =' => '8',
						'6 + 3 =' => '9',
						'6 + 4 =' => '10',
						'6 + 5 =' => '11',
						'6 + 6 =' => '12',
						'6 + 7 =' => '13',
						'6 + 8 =' => '14',
						'6 + 9 =' => '15',
						'7 + 0 =' => '7',
						'7 + 1 =' => '8',
						'7 + 2 =' => '9',
						'7 + 3 =' => '10',
						'7 + 4 =' => '11',
						'7 + 5 =' => '12',
						'7 + 6 =' => '13',
						'7 + 7 =' => '14',
						'7 + 8 =' => '15',
						'7 + 9 =' => '16',
						'8 + 0 =' => '8',
						'8 + 1 =' => '9',
						'8 + 2 =' => '10',
						'8 + 3 =' => '11',
						'8 + 4 =' => '12',
						'8 + 5 =' => '13',
						'8 + 6 =' => '14',
						'8 + 7 =' => '15',
						'8 + 8 =' => '16',
						'8 + 9 =' => '17',
						'9 + 0 =' => '9',
						'9 + 1 =' => '10',
						'9 + 2 =' => '11',
						'9 + 3 =' => '12',
						'9 + 4 =' => '13',
						'9 + 5 =' => '14',
						'9 + 6 =' => '15',
						'9 + 7 =' => '16',
						'9 + 8 =' => '17',
						'9 + 9 =' => '18',
						'0 - 0 =' => '0',
						'0 - 1 =' => '-1',
						'0 - 2 =' => '-2',
						'0 - 3 =' => '-3',
						'0 - 4 =' => '-4',
						'0 - 5 =' => '-5',
						'0 - 6 =' => '-6',
						'0 - 7 =' => '-7',
						'0 - 8 =' => '-8',
						'0 - 9 =' => '-9',
						'1 - 0 =' => '1',
						'1 - 1 =' => '0',
						'1 - 2 =' => '-1',
						'1 - 3 =' => '-2',
						'1 - 4 =' => '-3',
						'1 - 5 =' => '-4',
						'1 - 6 =' => '-5',
						'1 - 7 =' => '-6',
						'1 - 8 =' => '-7',
						'1 - 9 =' => '-8',
						'2 - 0 =' => '2',
						'2 - 1 =' => '1',
						'2 - 2 =' => '0',
						'2 - 3 =' => '-1',
						'2 - 4 =' => '-2',
						'2 - 5 =' => '-3',
						'2 - 6 =' => '-4',
						'2 - 7 =' => '-5',
						'2 - 8 =' => '-6',
						'2 - 9 =' => '-7',
						'3 - 0 =' => '3',
						'3 - 1 =' => '2',
						'3 - 2 =' => '1',
						'3 - 3 =' => '0',
						'3 - 4 =' => '-1',
						'3 - 5 =' => '-2',
						'3 - 6 =' => '-3',
						'3 - 7 =' => '-4',
						'3 - 8 =' => '-5',
						'3 - 9 =' => '-6',
						'4 - 0 =' => '4',
						'4 - 1 =' => '3',
						'4 - 2 =' => '2',
						'4 - 3 =' => '1',
						'4 - 4 =' => '0',
						'4 - 5 =' => '-1',
						'4 - 6 =' => '-2',
						'4 - 7 =' => '-3',
						'4 - 8 =' => '-4',
						'4 - 9 =' => '-5',
						'5 - 0 =' => '5',
						'5 - 1 =' => '4',
						'5 - 2 =' => '3',
						'5 - 3 =' => '2',
						'5 - 4 =' => '1',
						'5 - 5 =' => '0',
						'5 - 6 =' => '-1',
						'5 - 7 =' => '-2',
						'5 - 8 =' => '-3',
						'5 - 9 =' => '-4',
						'6 - 0 =' => '6',
						'6 - 1 =' => '5',
						'6 - 2 =' => '4',
						'6 - 3 =' => '3',
						'6 - 4 =' => '2',
						'6 - 5 =' => '1',
						'6 - 6 =' => '0',
						'6 - 7 =' => '-1',
						'6 - 8 =' => '-2',
						'6 - 9 =' => '-3',
						'7 - 0 =' => '7',
						'7 - 1 =' => '6',
						'7 - 2 =' => '5',
						'7 - 3 =' => '4',
						'7 - 4 =' => '3',
						'7 - 5 =' => '2',
						'7 - 6 =' => '1',
						'7 - 7 =' => '0',
						'7 - 8 =' => '-1',
						'7 - 9 =' => '-2',
						'8 - 0 =' => '8',
						'8 - 1 =' => '7',
						'8 - 2 =' => '6',
						'8 - 3 =' => '5',
						'8 - 4 =' => '4',
						'8 - 5 =' => '3',
						'8 - 6 =' => '2',
						'8 - 7 =' => '1',
						'8 - 8 =' => '0',
						'8 - 9 =' => '-1',
						'9 - 0 =' => '9',
						'9 - 1 =' => '8',
						'9 - 2 =' => '7',
						'9 - 3 =' => '6',
						'9 - 4 =' => '5',
						'9 - 5 =' => '4',
						'9 - 6 =' => '3',
						'9 - 7 =' => '2',
						'9 - 8 =' => '1',
						'9 - 9 =' => '0',
						'0 × 0 =' => '0',
						'0 × 1 =' => '0',
						'0 × 2 =' => '0',
						'0 × 3 =' => '0',
						'0 × 4 =' => '0',
						'0 × 5 =' => '0',
						'0 × 6 =' => '0',
						'0 × 7 =' => '0',
						'0 × 8 =' => '0',
						'0 × 9 =' => '0',
						'1 × 0 =' => '0',
						'1 × 1 =' => '1',
						'1 × 2 =' => '2',
						'1 × 3 =' => '3',
						'1 × 4 =' => '4',
						'1 × 5 =' => '5',
						'1 × 6 =' => '6',
						'1 × 7 =' => '7',
						'1 × 8 =' => '8',
						'1 × 9 =' => '9',
						'2 × 0 =' => '0',
						'2 × 1 =' => '2',
						'2 × 2 =' => '4',
						'2 × 3 =' => '6',
						'2 × 4 =' => '8',
						'2 × 5 =' => '10',
						'2 × 6 =' => '12',
						'2 × 7 =' => '14',
						'2 × 8 =' => '16',
						'2 × 9 =' => '18',
						'3 × 0 =' => '0',
						'3 × 1 =' => '3',
						'3 × 2 =' => '6',
						'3 × 3 =' => '9',
						'3 × 4 =' => '12',
						'3 × 5 =' => '15',
						'3 × 6 =' => '18',
						'3 × 7 =' => '21',
						'3 × 8 =' => '24',
						'3 × 9 =' => '27',
						'4 × 0 =' => '0',
						'4 × 1 =' => '4',
						'4 × 2 =' => '8',
						'4 × 3 =' => '12',
						'4 × 4 =' => '16',
						'4 × 5 =' => '20',
						'4 × 6 =' => '24',
						'4 × 7 =' => '28',
						'4 × 8 =' => '32',
						'4 × 9 =' => '36',
						'5 × 0 =' => '0',
						'5 × 1 =' => '5',
						'5 × 2 =' => '10',
						'5 × 3 =' => '15',
						'5 × 4 =' => '20',
						'5 × 5 =' => '25',
						'5 × 6 =' => '30',
						'5 × 7 =' => '35',
						'5 × 8 =' => '40',
						'5 × 9 =' => '45',
						'6 × 0 =' => '0',
						'6 × 1 =' => '6',
						'6 × 2 =' => '12',
						'6 × 3 =' => '18',
						'6 × 4 =' => '24',
						'6 × 5 =' => '30',
						'6 × 6 =' => '36',
						'6 × 7 =' => '42',
						'6 × 8 =' => '48',
						'6 × 9 =' => '54',
						'7 × 0 =' => '0',
						'7 × 1 =' => '7',
						'7 × 2 =' => '14',
						'7 × 3 =' => '21',
						'7 × 4 =' => '28',
						'7 × 5 =' => '35',
						'7 × 6 =' => '42',
						'7 × 7 =' => '49',
						'7 × 8 =' => '56',
						'7 × 9 =' => '63',
						'8 × 0 =' => '0',
						'8 × 1 =' => '8',
						'8 × 2 =' => '16',
						'8 × 3 =' => '24',
						'8 × 4 =' => '32',
						'8 × 5 =' => '40',
						'8 × 6 =' => '48',
						'8 × 7 =' => '56',
						'8 × 8 =' => '64',
						'8 × 9 =' => '72',
						'9 × 0 =' => '0',
						'9 × 1 =' => '9',
						'9 × 2 =' => '18',
						'9 × 3 =' => '27',
						'9 × 4 =' => '36',
						'9 × 5 =' => '45',
						'9 × 6 =' => '54',
						'9 × 7 =' => '63',
						'9 × 8 =' => '72',
						'9 × 9 =' => '81',
						'0 ÷ 1 =' => '0',
						'0 ÷ 2 =' => '0',
						'0 ÷ 3 =' => '0',
						'0 ÷ 4 =' => '0',
						'0 ÷ 5 =' => '0',
						'0 ÷ 6 =' => '0',
						'0 ÷ 7 =' => '0',
						'0 ÷ 8 =' => '0',
						'0 ÷ 9 =' => '0',
						'1 ÷ 1 =' => '1',
						'1 ÷ 2 =' => '0 r 1',
						'1 ÷ 3 =' => '0 r 1',
						'1 ÷ 4 =' => '0 r 1',
						'1 ÷ 5 =' => '0 r 1',
						'1 ÷ 6 =' => '0 r 1',
						'1 ÷ 7 =' => '0 r 1',
						'1 ÷ 8 =' => '0 r 1',
						'1 ÷ 9 =' => '0 r 1',
						'2 ÷ 1 =' => '2',
						'2 ÷ 2 =' => '1',
						'2 ÷ 3 =' => '0 r 2',
						'2 ÷ 4 =' => '0 r 2',
						'2 ÷ 5 =' => '0 r 2',
						'2 ÷ 6 =' => '0 r 2',
						'2 ÷ 7 =' => '0 r 2',
						'2 ÷ 8 =' => '0 r 2',
						'2 ÷ 9 =' => '0 r 2',
						'3 ÷ 1 =' => '3',
						'3 ÷ 2 =' => '1 r 1',
						'3 ÷ 3 =' => '1',
						'3 ÷ 4 =' => '0 r 3',
						'3 ÷ 5 =' => '0 r 3',
						'3 ÷ 6 =' => '0 r 3',
						'3 ÷ 7 =' => '0 r 3',
						'3 ÷ 8 =' => '0 r 3',
						'3 ÷ 9 =' => '0 r 3',
						'4 ÷ 1 =' => '4',
						'4 ÷ 2 =' => '2',
						'4 ÷ 3 =' => '1 r 1',
						'4 ÷ 4 =' => '1',
						'4 ÷ 5 =' => '0 r 4',
						'4 ÷ 6 =' => '0 r 4',
						'4 ÷ 7 =' => '0 r 4',
						'4 ÷ 8 =' => '0 r 4',
						'4 ÷ 9 =' => '0 r 4',
						'5 ÷ 1 =' => '5',
						'5 ÷ 2 =' => '2 r 1',
						'5 ÷ 3 =' => '1 r 2',
						'5 ÷ 4 =' => '1 r 1',
						'5 ÷ 5 =' => '1',
						'5 ÷ 6 =' => '0 r 5',
						'5 ÷ 7 =' => '0 r 5',
						'5 ÷ 8 =' => '0 r 5',
						'5 ÷ 9 =' => '0 r 5',
						'6 ÷ 1 =' => '6',
						'6 ÷ 2 =' => '3',
						'6 ÷ 3 =' => '2',
						'6 ÷ 4 =' => '1 r 2',
						'6 ÷ 5 =' => '1 r 1',
						'6 ÷ 6 =' => '1',
						'6 ÷ 7 =' => '0 r 6',
						'6 ÷ 8 =' => '0 r 6',
						'6 ÷ 9 =' => '0 r 6',
						'7 ÷ 1 =' => '7',
						'7 ÷ 2 =' => '3 r 1',
						'7 ÷ 3 =' => '2 r 1',
						'7 ÷ 4 =' => '1 r 3',
						'7 ÷ 5 =' => '1 r 2',
						'7 ÷ 6 =' => '1 r 1',
						'7 ÷ 7 =' => '1',
						'7 ÷ 8 =' => '0 r 7',
						'7 ÷ 9 =' => '0 r 7',
						'8 ÷ 1 =' => '8',
						'8 ÷ 2 =' => '4',
						'8 ÷ 3 =' => '2 r 2',
						'8 ÷ 4 =' => '2',
						'8 ÷ 5 =' => '1 r 3',
						'8 ÷ 6 =' => '1 r 2',
						'8 ÷ 7 =' => '1 r 1',
						'8 ÷ 8 =' => '1',
						'8 ÷ 9 =' => '0 r 8',
						'9 ÷ 1 =' => '9',
						'9 ÷ 2 =' => '4 r 1',
						'9 ÷ 3 =' => '3',
						'9 ÷ 4 =' => '2 r 1',
						'9 ÷ 5 =' => '1 r 4',
						'9 ÷ 6 =' => '1 r 3',
						'9 ÷ 7 =' => '1 r 2',
						'9 ÷ 8 =' => '1 r 1',
						'9 ÷ 9 =' => '1');

my $strFontPath = PerlApp::extract_bound_file('VeraMono.ttf');

my $intProgState = 0;

my @listFrames;

my $mainWindow = MainWindow->new();
$mainWindow->withdraw();
$mainWindow->title('FlashCards - Brandon Bourret');
$mainWindow->resizable(0, 0);
my $imgNextCard = $mainWindow->Photo( 	-format => 'png',
                                        -data =>										'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');
my $imgFlipCard = $mainWindow->Photo( 	-format => 'png',
										-data =>										'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');
my $imgPayPalDon = $mainWindow->Photo( 	-format => 'png',
										-data =>										'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');
$mainWindow->iconbitmap(PerlApp::extract_bound_file('cards32.ico'));
	my $imgCard = $mainWindow->Photo(	-format => 'png',
										-data => &RenderBlack);
	my $cardPanel = $mainWindow->Frame(	-width => 360,
										-height => 200)->pack(	-side => 'top');
		$cardPanel->Label(	-image => $imgCard)->pack(	-side => 'top');		
	my $controlPanel = $mainWindow->Frame()->pack(	-side => 'top',
													-anchor => 'w');
		my $butNext = $controlPanel->Button(	-image => $imgNextCard,
												-relief => 'flat',
												-command => \&TakeAction)->pack(	-side => 'right',
																					-padx => 15,
																					-pady => 5);
		$controlPanel->Button(	-image => $imgPayPalDon,
								-relief => 'flat',
								-command => sub {
													system('xdg-open "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=LBYCSFWJCXRVE&source=url" &');
												})->pack(	-side => 'left',
															-padx => 15,
															-pady => 5);

$mainWindow->Popup();

$mainWindow->MainLoop();

sub TakeAction
{
	$butNext->configure(	-state => 'disabled');
	my $boolDoneRender = 0;
	while(!$boolDoneRender)
	{
		if($intProgState == 0)
		{
			@listFrames = &RenderImages;
			$intProgState = 1;
		}
		if($intProgState == 1)
		{
			for(my $i = 20; $i >= 0; $i -= 1)
			{
				$imgCard->configure(	-data => $listFrames[$i]);
				$mainWindow->DoOneEvent(0);
				usleep(5000);
			}
			$butNext->configure(	-image => $imgFlipCard);
			$boolDoneRender = 1;
		}
		if($intProgState == 2)
		{
			for(my $i = 0; $i < 42; $i += 1)
			{
				$imgCard->configure(	-data => $listFrames[$i]);
				$mainWindow->DoOneEvent(0);
				usleep(5000);
			}
			$butNext->configure(	-image => $imgNextCard);
			$boolDoneRender = 1;
		}
		if($intProgState == 3)
		{
			for(my $i = 41; $i > 20; $i -= 1)
			{
				$imgCard->configure(	-data => $listFrames[$i]);
				$mainWindow->DoOneEvent(0);
				usleep(5000);
			}
			$boolDoneRender = 1;
		}
		$intProgState += 1;
		if($intProgState > 3)
		{
			$intProgState = 0;
			$boolDoneRender = 0;
		}
	}
	$butNext->configure(	-state => 'normal');
	return;
}

sub RenderBlack
{
	my $imgBlack = new GD::Image(360, 200);
	my $imgBlackBlack = $imgBlack->colorAllocate(0, 0, 0);
	$imgBlack->rectangle(0, 0, 360, 200, $imgBlackBlack);
	$imgBlack->fill(1, 1, $imgBlackBlack);
	return(encode_base64($imgBlack->png, ''));
}

sub RenderImages
{
	my @listBatteryItems;
	my $strBatteryItem;
	my $strBatteryAnswer;
	my $intNumberItemLines;
	my $intNumberAnswerLines;
	@listBatteryItems = keys(%listBatteryHash);
	$strBatteryItem = $listBatteryItems[int(rand(scalar(@listBatteryItems)))];
	$strBatteryAnswer = $listBatteryHash{$strBatteryItem};
	$strBatteryItem = &TextWrap($strBatteryItem);
	$intNumberItemLines = () = $strBatteryItem =~ /\n/gi;
	$intNumberItemLines += 1;
	$strBatteryAnswer = &TextWrap($strBatteryAnswer);
	$intNumberAnswerLines = () = $strBatteryAnswer =~ /\n/gi;
	$intNumberAnswerLines += 1;
	my $imgBatteryItem = new GD::Image(360, 200);
	my $imgBatteryItemWhite = $imgBatteryItem->colorAllocate(255, 255, 255);
	my $imgBatteryItemBlack = $imgBatteryItem->colorAllocate(0, 0, 0);
	$imgBatteryItem->rectangle(0, 0, 360, 200, $imgBatteryItemWhite);
	$imgBatteryItem->fill(1, 1, $imgBatteryItemWhite);
	my $intTTFDimX = 0;
	my $intTTFDimY = 0;
	my $intFontSize = 40;
	my $boolTooBig = 1;
	while($boolTooBig)
	{
		my @listBounds = GD::Image->stringTTF($imgBatteryItemBlack, $strFontPath, $intFontSize, 0, 0, 0, $strBatteryItem);
		if(($listBounds[2] - $listBounds[0]) > 350)
		{
			$intFontSize -= 2;
		}
		else
		{
			$boolTooBig = 0;
			$intTTFDimX = $listBounds[2] - $listBounds[0];
			$intTTFDimY = abs($listBounds[5]) + abs($listBounds[1]);
		}
	}
	$imgBatteryItem->stringTTF($imgBatteryItemBlack, $strFontPath, $intFontSize, 0, int((360 - $intTTFDimX) / 2), (int(200 - $intTTFDimY) / 2) + int($intTTFDimY / $intNumberItemLines), $strBatteryItem);
	
	my $imgBatteryAnswer = new GD::Image(360, 200);
	my $imgBatteryAnswerWhite = $imgBatteryAnswer->colorAllocate(255, 255, 255);
	my $imgBatteryAnswerBlack = $imgBatteryAnswer->colorAllocate(0, 0, 0);
	$imgBatteryAnswer->rectangle(0, 0, 360, 200, $imgBatteryAnswerWhite);
	$imgBatteryAnswer->fill(1, 1, $imgBatteryAnswerWhite);
	$intTTFDimX = 0;
	$intTTFDimY = 0;
	$intFontSize = 40;
	$boolTooBig = 1;
	while($boolTooBig)
	{
		my @listBounds = GD::Image->stringTTF($imgBatteryAnswerBlack, $strFontPath, $intFontSize, 0, 0, 0, $strBatteryAnswer);
		if(($listBounds[2] - $listBounds[0]) > 350)
		{
			$intFontSize -= 2;
		}
		else
		{
			$boolTooBig = 0;
			$intTTFDimX = $listBounds[2] - $listBounds[0];
			$intTTFDimY = abs($listBounds[5]) + abs($listBounds[1]);
		}
	}
	$imgBatteryAnswer->stringTTF($imgBatteryAnswerBlack, $strFontPath, $intFontSize, 0, int((360 - $intTTFDimX) / 2), (int(200 - $intTTFDimY) / 2) + int($intTTFDimY / $intNumberAnswerLines), $strBatteryAnswer);
	
	my $intFrameDimY = 200;
	my @listPNGFrames;
	for(my $i = 0; $i < 20; $i += 1)
	{
		$intFrameDimY -= 10;
		my $imgSingleFrame = new GD::Image(360, 200);
		my $imgSingleFrameBlack = $imgSingleFrame->colorAllocate(0, 0, 0);
		$imgSingleFrame->rectangle(0, 0, 360, 200, $imgSingleFrameBlack);
		$imgSingleFrame->fill(1, 1, $imgSingleFrameBlack);
		$imgSingleFrame->copyResized($imgBatteryItem, 0, ((200 - $intFrameDimY) / 2) , 0, 0, 360, $intFrameDimY, 360, 200);
		push(@listPNGFrames, encode_base64($imgSingleFrame->png, ''));
	}
	$intFrameDimY = 0;
	for(my $i = 0; $i < 20; $i += 1)
	{
		$intFrameDimY += 10;
		my $imgSingleFrame = new GD::Image(360, 200);
		my $imgSingleFrameBlack = $imgSingleFrame->colorAllocate(0, 0, 0);
		$imgSingleFrame->rectangle(0, 0, 360, 200, $imgSingleFrameBlack);
		$imgSingleFrame->fill(1, 1, $imgSingleFrameBlack);
		$imgSingleFrame->copyResized($imgBatteryAnswer, 0, ((200 - $intFrameDimY) / 2) , 0, 0, 360, $intFrameDimY, 360, 200);
		push(@listPNGFrames, encode_base64($imgSingleFrame->png, ''));
	}
	unshift(@listPNGFrames, encode_base64($imgBatteryItem->png, ''));
	push(@listPNGFrames, encode_base64($imgBatteryAnswer->png, ''));
	return(@listPNGFrames);
}

sub TextWrap($)
{
	my $subStrText = shift(@_);
	$subStrText =~ s/[\t]/ /g;
	if((length($subStrText) > 28) && ($subStrText !~ m/\n/))
	{
		$subStrText =~ s/([^0-9\s])-([^0-9\s])/$1 $2/g;
		my @listTextLines;
		while(length($subStrText))
		{
			my $strTempText = substr($subStrText, 0, 28);
			if(length($strTempText) < 28)
			{
				$strTempText =~ s/[\s\-]$//;
			}
			else
			{
				$strTempText =~ s/[\s\-][^\s\-]{1,}$//;
			}
			push(@listTextLines, $strTempText . "\n");
			$subStrText =~ s/^\Q$strTempText\E\s{0,}//i;
		}
		chomp($listTextLines[-1]);
		$subStrText = join('', @listTextLines);
	}
	return($subStrText);
}
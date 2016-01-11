require File.join(File.dirname(__FILE__), 'helper')

require 'rack/test'

class TestMarkdownToPDF < Minitest::Test
  include Rack::Test::Methods

  def setup
    app.params = {
      'owner' => 'benbalter',
      'repo' => 'markdown-to-pdf',
      'splat' => ['README.md'],
      'ref' => 'master'
    }
  end

  def app
    @app ||= MarkdownToPDF::App.new.instance_variable_get :@instance
  end

  def test_knows_nwo
    assert_equal 'benbalter/markdown-to-pdf', app.nwo
  end

  def test_knows_the_path
    assert_equal 'README.md', app.path
  end

  def test_swaps_pdf_extension
    app.params['splat'] = ['README.pdf']
    assert_equal 'README.md', app.path
  end

  def test_handles_subdirs
    app.params['splat'] = ['foo', 'README.pdf']
    assert_equal 'foo/README.md', app.path
  end

  def test_knows_ref
    assert_equal 'master', app.ref
  end

  def test_creates_the_client
    assert_equal Octokit::Client, app.client.class
  end

  def test_retreives_the_markdown
    VCR.use_cassette 'markdown-to-pdf' do
      readme = File.expand_path '../README.md', File.dirname(__FILE__)
      expected = open(readme).read
      assert_equal expected, app.markdown
    end
  end

  def test_generates_html
    VCR.use_cassette 'markdown-to-pdf' do
      assert app.html =~ %r{Markdown to PDF</h1>$}m
    end
  end

  def test_knows_where_the_stylesheet_is
    assert File.exist?(app.stylesheet)
  end

  def test_creates_pdfkit_instance
    VCR.use_cassette 'markdown-to-pdf' do
      assert_equal PDFKit, app.kit.class
    end
  end

  def test_stylesheets
    VCR.use_cassette 'markdown-to-pdf' do
      assert_equal 1, app.kit.stylesheets.size
      assert File.exist?(app.kit.stylesheets.first)
    end
  end

  def test_returns_the_pdf
    VCR.use_cassette 'markdown-to-pdf' do
      get 'benbalter/markdown-to-pdf/blob/master/README.md'
      assert_equal 'application/pdf', last_response['Content-Type']
      assert last_response['Content-Length'].to_i > 0
      assert last_response.body =~ /adobe/i
    end
  end
end

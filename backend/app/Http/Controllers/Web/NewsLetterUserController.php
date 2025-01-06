<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\NewsletterUser;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class NewsLetterUserController extends Controller
{
    //
    public function newsletter()
    {
        return view('web.newsletter.newsletter');
    }

    public function submitNewsletter(Request $request)
    {
        // Validate the incoming request
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:newsletter_users,email', // Added unique validation
            'phone' => 'nullable|string|max:20',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->with('error', 'Erro na valição de formulário')
                ->withErrors($validator)
                ->withInput();
        }

        try {
            $validatedData = $validator->validated();
            $validatedData['hash'] = Str::uuid();

            // Attempt to create the newsletter entry
            NewsletterUser::create($validatedData);

            return redirect()->back()->with('success', 'Obrigado pelo pré registo! Novidades virão.');
        } catch (Exception $exception) {
            // Handle the exception
            return redirect()->back()
                ->with('error', 'Algo aconteceu, última ocorrência:')
                ->with('exception', $exception->getMessage());
        }
    }
}

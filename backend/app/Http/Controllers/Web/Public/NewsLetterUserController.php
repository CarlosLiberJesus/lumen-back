<?php

declare(strict_types=1);

namespace App\Http\Controllers\Web\Public;

use App\Http\Controllers\Controller;
use App\Models\NewsletterUser;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

final class NewsLetterUserController extends Controller
{
    //
    public function newsletter(): View
    {
        return view('public.newsletter.newsletter');
    }

    public function submitNewsletter(Request $request): RedirectResponse
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

        // Create a new newsletter user
        NewsletterUser::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'token' => Str::random(60),
        ]);

        return redirect()->back()->with('success', 'Inscrição realizada com sucesso!');
    }
}

<?php

declare(strict_types=1);

namespace App\Http\Controllers\Auth\Web;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

final class WebLoginController extends Controller
{
    public function loginPane(): View
    {
        $breadcrumbs = [
            ['url' => '/', 'label' => 'Ínicio'],
            ['url' => '#', 'label' => 'Login'],
        ];

        $title = 'Api BeWhyOrg Login';

        return view('public.auth.login', ['breadcrumbs' => $breadcrumbs, 'title' => $title]);
    }

    public function login(Request $request): RedirectResponse
    {
        // Validate the request...
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user && $user->roles->contains('role_id', 1)) {
                $request->session()->regenerate();

                return redirect()->intended('dashboard');
            }

            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();

            return back()->withErrors([
                'email' => 'Não é suposto entrar onde não se sabe.',
            ]);

        }

        return back()->withErrors([
            'email' => 'Os dados fornecidos não permitem continuar.',
        ]);
    }

    public function logout(Request $request): RedirectResponse
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
